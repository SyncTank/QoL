extends CharacterBody3D

## Camera
@onready var visual = $visuals
@onready var mount = $Mount
@onready var spring_arm_3d: SpringArm3D = $Mount/SpringArm3D
@onready var camera_3d: Camera3D = $Mount/SpringArm3D/Camera3D
@onready var view_offset: Marker3D = $view_offset

## UI Elements 
@onready var spd = $DebugInfo/Line/SpeedBox/HBoxContainer/values
@onready var vel = $DebugInfo/Line/SpeedBox/HBoxContainer2/values

## User agent movement
@export_category('Controller')
@export_group('character')
@export var SPEED: float = 3
@export var JUMP_VELOCITY: float = 4.5
@export var walking_speed: float = 3
@export var running_speed: float = 5
@onready var skeleton_3d: Skeleton3D = $visuals/mixamo_base/Armature/Skeleton3D
var accel: Vector3

@export_group('mouse')
@export var sens_horiztonal: float = .2
@export var sens_vertical: float = .2
@export var max_zoom: int = 50
const push_force: float = 2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	print_rich('[b]Starting [color=blue]Player[/color][/b]')
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _input(event):
	if event is InputEventMouseMotion:
		var viewport = get_tree().root.get_final_transform()

		# NOTE: relative to Cc3 parent
		self.rotate_y(deg_to_rad(-event.relative.x * sens_horiztonal))
		# NOTE: rotate camera off of character
		visual.rotate_y(deg_to_rad(event.relative.x * sens_horiztonal))
		# NOTE: relative to the mount node 
		mount.rotate_x(deg_to_rad(-event.relative.y * sens_vertical))
		#TODO: add offsets to the rotations or combine with above
		mount.rotation_degrees.x = clampf(mount.rotation_degrees.x, -70, 65)


func _physics_process(delta: float) -> void:
	
	spd.text = str(SPEED)
	vel.text = str(velocity)
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("test"):
		var space_state = get_world_3d().direct_space_state
		var mousepos = get_viewport().get_mouse_position()
		
		var origin = camera_3d.project_ray_origin(mousepos)
		var end = origin + camera_3d.project_ray_origin(mousepos) * 5 # Raylength
		var query = PhysicsRayQueryParameters3D.create(origin, end)
		query.collide_with_areas = true
		query.exclude = [self] # use the collision layer/mask system. plusself
		var result = space_state.intersect_ray(query)
		if result:
			print("Hit ", result.position, result.rid, result.collider)
		
	if Input.is_action_just_pressed("sprint"):
		SPEED = running_speed
	elif Input.is_action_just_released("sprint"):
		SPEED = walking_speed

	if Input.is_action_just_pressed("test"):
		print("dolling")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		if Input.is_action_pressed("aim"):
			visual.rotation = Vector3.ZERO
		else:
			visual.look_at( global_position + direction )
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	# collision for the character controller on rigidbodies
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody3D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
