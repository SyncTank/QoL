<?php 

$heading = 'Note';

$dsn = require 'dbconfig.php';
$db = new Database($dsn['database'],"uroot", "!ERTQSIsInR5cCI6IkpXVCJ9$");

$id = $_GET['id'];
$db->query("SELECT * FROM notes WHERE id = :id", ['id' => $id]);
$notes = $db->fetchAll_Data();

require 'views/notes.view.php';