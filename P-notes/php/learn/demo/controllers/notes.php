<?php 

$heading = 'Notes';

$dsn = require 'dbconfig.php';
$db = new Database($dsn['database'],"uroot", "!ERTQSIsInR5cCI6IkpXVCJ9$");

$db->query("SELECT * FROM notes WHERE user_id=1");
$notes = $db->fetchAll_Data();

require 'views/notes.view.php';