<?php
class Database{
    private $dsn;
    private $username;
    private $password;
    private $pdo;
    private $data;
    
    function __construct($config, $usr, $ps){
        $this->dsn = 'mysql:' . http_build_query($config, '', ';');
        $this->username = $usr;
        $this->password = $ps;
        $this->connect();
    }

    private function connect(){
    try {
        $this->pdo = new PDO($this->dsn, $this->username, $this->password);
        $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        echo "Connection successful!";
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }
    }

    public function query(string $statement, $param = []){
        $this->data = $this->pdo->prepare($statement);
        $this->data->execute($param);
    }

    public function fetchAll_Data(){
        $this->data = $this->data->fetchAll(PDO::FETCH_ASSOC);
        return $this->data;
    }
    public function fetch_Data(){
        $this->data = $this->data->fetch(PDO::FETCH_ASSOC);
        return $this->data;
    }
}