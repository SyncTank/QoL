class ECS:
    def __init__(self):
        self.entities = []  # List of entity IDs
        self.components = []  # Dense storage for component data
        self.entity_to_component = {}  # Sparse mapping (entity → index in components)

    def add_entity(self, entity, component):
        self.entities.append(entity)
        index = len(self.components)  # Next free slot
        self.components.append(component)
        self.entity_to_component[entity] = index  # Sparse mapping

    def remove_entity(self, entity):
        index = self.entity_to_component.pop(entity, None)
        if index is not None:
            # Swap with last component to maintain contiguous memory
            last_index = len(self.components) - 1
            self.components[index] = self.components[last_index]
            self.components.pop()

            # Update the moved entity's index
            for ent, idx in self.entity_to_component.items():
                if idx == last_index:
                    self.entity_to_component[ent] = index

    def get_component(self, entity):
        index = self.entity_to_component.get(entity, None)
        if index is not None:
            return self.components[index]  # Pass-by-value component retrieval

# Example Usage
ecs = ECS()
ecs.add_entity(1, {"position": (10, 20), "velocity": (5, -2)})
ecs.add_entity(2, {"position": (30, 40), "velocity": (-3, 1)})
ecs.remove_entity(1)  # Efficiently removes entity without fragmentation
print(ecs.get_component(2))  # Access component by value

if (IsOnFloor())
		{
			if (direction != Vector3.Zero){
				
				if (Input.IsActionPressed("Focus Action")){
				} else {
					Ray.LookAt(mount.Transform.Basis.Z, Vector3.Up);
				} 
				velocity.X = direction.X * Speed;
				velocity.Z = direction.Z * Speed;

			} else {
				velocity.X = (float)Mathf.Lerp(velocity.X, direction.X * Speed, delta * 25.0f);
				velocity.Z = (float)Mathf.Lerp(velocity.Z, direction.Z * Speed, delta * 25.0f);

				// Chacacter controller movement
				//velocity.X = Mathf.MoveToward(Velocity.X, 0, Speed);
				//velocity.Z = Mathf.MoveToward(Velocity.Z, 0, Speed);
			}		
		} else {
			velocity.X = (float)Mathf.Lerp(velocity.X, direction.X * Speed, delta * 4.0f);
			velocity.Z = (float)Mathf.Lerp(velocity.Z, direction.Z * Speed, delta * 4.0f);
		}