<?php

    class sqsModel {

        private $dbconn;

        public function __construct() {
            $dbURI = 'mysql:host=' . $_ENV['HOST'] . ';port=3306;dbname=' . $_ENV['DBASE'];
            $this->dbconn = new PDO($dbURI, $_ENV['USER'], $_ENV['PASS']);
            $this->dbconn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }

        function checkLogin($u, $p) {
            // Return uid if user/password tendered are correct otherwise 0
            return true;
        }
        function userExists($u) {
            // return true if user is already in the Database
            return true;
        }
        function registerUser($u, $p, $e, $ph) {
            // Retister user into system, assume validation has happened.
            // return UID created or false if fail
            return false;
        }
    }
?>
