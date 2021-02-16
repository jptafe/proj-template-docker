<?php

    class sqsSession {
        // ever attribute here will be stored in session, but make sure you always test incognito

        public function __construct() {

        }
        public function is_rate_limited() {
            // do some calculations 
            return false;
        }
        public function login() {
            // call the dbobject for SQL
            // return a session hash if successfull
            return Array('Hash'=>'90q2u3lksafdu90342oifkl');
        }
        public function register() {
            // call the dbobject for SQL
            return true;
        }
    }
?>
