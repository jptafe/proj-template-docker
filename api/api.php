<?php

require_once('./vendor/autoload.php');
require_once('./db.php');
require_once('./se.php');

$sqsdb = new sqsModel;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\RedirectResponse;

$request = Request::createFromGlobals();
$response = new Response();
$session = new Session();

$response->headers->set('Content-Type', 'application/json');
$response->headers->set('Access-Control-Allow-Headers', 'origin, content-type, accept');
$response->headers->set('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
$response->headers->set('Access-Control-Allow-Origin', $_ENV['ORIGIN']);
$response->headers->set('Access-Control-Allow-Credentials', 'true');

$session->start();

if($session->has('sessionObj') == false) {
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
                    $request->request->has('email'),
                    $request->request->has('phone')
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
                    $response->setStatusCode(403);
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
        if($request->query->getAlpha('action') == 'showqueue') {
            $response->setStatusCode(404);
            //$outstring = $sqsdb->get_queue()
            //$response->setContent($outstring); // there is a queue
        }
        elseif($request->query->getAlpha('action') == 'accountexists') {
            $response->setStatusCode(204);
        } elseif($request->query->getAlpha('action') == 'securepage') {
            // if user loggedin
            //$response->setStatusCode(200);
            $response->setStatusCode(403);
        } elseif($request->query->getAlpha('action') == 'logout') {
            $response->setContent(json_encode(Array('Success'=>'true')));
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
    $redirect = new RedirectResponse('api.php');
}


$response->send();

?>
