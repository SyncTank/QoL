<?php


$uri = parse_url($_SERVER['REQUEST_URI'])['path'];

function abort($status = 404){
    http_response_code($status);
    require "views/{$status}.php";
    die();
}


$routes = [
    '/' => 'controllers/index.php',
    '/about' => 'controllers/about.php',
    '/notes' => 'controllers/notes.php',
    '/note' => 'controllers/note.php',
    '/contact' => 'controllers/contact.php',
    '/mission' => 'controllers/mission.php'
];

function routeToControllers($uri, $routes){
    if (array_key_exists($uri, $routes)){
        require $routes[$uri];
    }
    else{
    abort(404); 
    }
}

routeToControllers($uri, $routes);

