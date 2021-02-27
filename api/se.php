<?php

    class sqsSession {
        // attributes will be stored in session, but always test incognito
        private int $last_visit = 0;
        private $last_visits = Array();

        private $user_id = 0;
        private $user_name;
        private $user_icon;
        private $user_color;
        private $user_privilege = 0;

        private $origin;

        public function __construct() {
            $this->origin = $_ENV['ORIGIN'];
        }
        public function is_rate_limited() {
            if($last_visit == 0) {
                $last_visit = time();
                return false;
            }
            if($last_visit == time()) {
                return true;
            }
            return false;
        }
        public function login($username, $password) {
            global $sqsdb;
            // call the dbobject for SQL
            // return a session hash if successful
            $this->user_id = $sqsdb->checkLogin($username, $password);
            if($this->user_id > 0) {
                return Array('Hash'=>'90q2u3lksafdu90342oifkl');
            } elseif($this->user_id === 0) {
                return 0;
            } else {
                return false;
            }
        }
        public function register($username, $password, $email, $phone) {
            global $sqsdb;

            // call the dbobject for SQL
            if($sqsdb->registerUser($username, $password, $email, $phone)) {
                return true;
            } else {
                return false;
            }
        }
        public function isLoggedIn() {
            if($this->user_id == 0) {
                return false;
            } else {
                return true;
            }
        }
        public function logout() {
            $this->user_id = 0;
        }
    }
?>
