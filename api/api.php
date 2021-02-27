<?php

require_once('./vendor/autoload.php');
require_once('./db.php');
require_once('./se.php');

$sqsdb = new sqsModel;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\Session\Attribute\AttributeBag;
use Symfony\Component\HttpFoundation\Session\Storage\NativeSessionStorage;
use Symfony\Component\HttpFoundation\RedirectResponse;

$request = Request::createFromGlobals();
$response = new Response();
$session = new Session(new NativeSessionStorage(), new AttributeBag());

$response->headers->set('Content-Type', 'application/json');
$response->headers->set('Access-Control-Allow-Headers', 'origin, content-type, accept');
$response->headers->set('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
$response->headers->set('Access-Control-Allow-Origin', $_ENV['ORIGIN']);
$response->headers->set('Access-Control-Allow-Credentials', 'true');

$session->start();

if(!$session->has('sessionObj')) {
    $session->set('sessionObj', new sqsSession);
}

if(empty($request->query->all())) {
    $response->setStatusCode(400);
} elseif($request->cookies->has('PHPSESSID')) {
    if($session->get('sessionObj')->is_rate_limited()) {
        $response->setStatusCode(429);
    } elseif($request->getMethod() == 'POST') {             // register, login
        if($request->query->getAlpha('action') == 'register') {
            if($request->request->has('username') and
                $request->request->has('password') and
                $request->request->has('email') and
                $request->request->has('phone')) {
                $res = $session->get('sessionObj')->register(
                    $request->request->getInt('username'),
                    $request->request->get('password'),
                    $request->request->get('email'),
                    $request->request->get('phone')
                );
                if($res == true) {
                    $response->setStatusCode(201);
                } else {
                    $response->setStatusCode(400);
                }
            } else {
                $response->setStatusCode(400);
            }
        } elseif($request->query->getAlpha('action') == 'login') {
            if($request->request->has('username') and
                $request->request->has('password')) {
                $res = $session->get('sessionObj')->login($request->request->getInt('username'),
                    $request->request->get('password'));
                if ($res == false) {
                    $response->setStatusCode(401);
                } else {
                    $response->setContent(json_encode($res));
                    $response->setStatusCode(200);
                }
            } else {
                $response->setStatusCode(400);
            }
        } else {
            $response->setStatusCode(400);
        }
    }
    if($request->getMethod() == 'GET') {              // showqueu, accountexists
        if($request->query->getAlpha('action') == 'accountexists') {
            if($request->query->has('username')) {
                $response->setStatusCode(204);
            } else {
                $response->setStatusCode(400);
            }
        } elseif($request->query->getAlpha('action') == 'isloggedin') {
            if($session->get('sessionObj')->isLoggedIn()) {
                $response->setStatusCode(200);
            } else {
                $response->setStatusCode(403);
            }
        } elseif($request->query->getAlpha('action') == 'logout') {
            $response->setStatusCode(200);
        } else {
            $response->setStatusCode(400);
        }
    }

    if($request->getMethod() == 'DELETE') {           // delete queue, delete comment
        $response->setStatusCode(400);
    }

    if($request->getMethod() == 'PUT') {              // enqueue, add comment
        $response->setStatusCode(400);
    }

} else {
    $redirect = new RedirectResponse($_SERVER['REQUEST_URI']);
}

$response->send();

?>
