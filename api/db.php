<?php

    /*
     */

    class sqsModel {

        private $dbconn;

        public function __construct() {
            //$this->dbconn = new PDO($_ENV['DBURI']);
            //debug; comment out in production
            //$this->dbconn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
    }
?>
