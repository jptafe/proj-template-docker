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
        private $user_token;

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

            $res = $sqsdb->checkLogin($username, $password);
            if($res === false) {
                return false;
            } elseif(count($res) > 1) {
                $this->user_id = $res['user_id'];
                $this->user_privilege = 1;
                $this->user_token = md5(json_encode($res));
                return Array('nick'=>$res['user_nick'],
                'theme'=>$res['user_theme'],
                'color'=>$res['user_color'],
                'icon'=>$res['user_icon'],
                'Hash'=>$this->user_token);
            } elseif(count($res) == 1) {
                $this->user_id = $res['user_id'];
                $this->user_token = md5(json_encode($res));
                return Array('Hash'=>$this->user_token);
            }
        }
        public function register($nick, $color, $icon, $pass, $csrf) {
            global $sqsdb;
            if($csrf == $this->user_token) {
                if($sqsdb->registerUser($this->user_id, $nick, $color, $icon, $pass)) {
                    return true;
                } else {
                    return 0;
                }
            } else {
                return false;
            }
            // call the dbobject for SQL
        }
        public function isLoggedIn() {
            if($this->user_id === 0) {
                return false;
            } else {
                return Array('Hash'=>$this->user_token);
            }
        }
        public function logout() {
            $this->user_id = 0;
            $this->user_privilege = 0;
        }
    }
?>
