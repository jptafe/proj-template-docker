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
            $sql = "SELECT * FROM student WHERE student_NO = :stno";
            $stmt = $this->dbconn->prepare($sql);
            $stmt->bindParam(':stno', $u, PDO::PARAM_INT);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                $retVal = $stmt->fetch(PDO::FETCH_ASSOC);
                if(strlen($retVal['pass']) > 0) {
                    if($retVal['pass'] == $p) {
                        return $retVal['student_NO'];
                    } else {
                        return false;
                    }
                } else {
                    return 0;
                }
            } else {
                return false;
            }
        }
        function userExists($u) {
            $sql = "SELECT * FROM student WHERE student_NO = :stno";
            $stmt = $this->dbconn->prepare($sql);
            $stmt->bindParam(':stno', $u, PDO::PARAM_INT);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                return true;
            } else {
                return false;
            }
        }
        function registerUser($u, $p, $e, $ph) {
            // Retister user into system, assume validation has happened.
            // return UID created or false if fail
            return false;
        }
    }
?>
