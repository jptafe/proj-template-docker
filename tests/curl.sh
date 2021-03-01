#!/bin/bash 
#+---------------------------------------+--------+------+--------+--------+----------+
#|                                       | CREATE | READ | UPDATE | DELETE | SESSION  |
#+---------------------------------------+--------+------+--------+--------+----------+
#+---------------------------------------+--------+------+--------+--------+----------+
#| login            POST                 |        |  *   |        |        |    *     |
#+---------------------------------------+--------+------+--------+--------+----------+
curl http://localhost:9998/api.php?action=login \
 -s -o /dev/null -w "%{http_code}" \
 --data "username=468299219&password=asdfqwer" \
 | grep -q 401 && echo 'OK' || echo 'ERR' 
# Invalid password 
sleep 1s

curl http://localhost:9998/api.php?action=login \
 -s -o /dev/null -w "%{http_code}" \
 --data "username=123412334&password=asdfqwer" \
 | grep -q 401 && echo 'OK' || echo 'ERR' 
# Invalid username 
sleep 1s

curl http://localhost:9998/api.php?action=login\&username=468299219\&password=asdfasdf \
 -s -o /dev/null -w "%{http_code}" \
 | grep -q 501 && echo 'OK' || echo 'ERR' 
# GET instead of POST 
sleep 1s

curl http://localhost:9998/api.php?action=login --cookie-jar cookie.txt \
 -s -o /dev/null -w "%{http_code}" \
 --data "username=468299219&password=asdfasdf" \
 | grep -q 200 && echo 'OK' || echo 'ERR' 
# login Success
sleep 1s

#+---------------------------------------+--------+------+--------+--------+----------+
#| logout           GET                  |        |      |        |        |    *     |
#+---------------------------------------+--------+------+--------+--------+----------+
curl http://localhost:9998api.php?action=logout \
 -s -o /dev/null -w "%{http_code}" \
 | grep -q 401 && echo 'OK' || echo 'ERR' 
# not logged in
sleep 1s

curl http://localhost:9998/sqs_api/api.php?action=logot \
 -s -o /dev/null -w "%{http_code}" \
 | grep -q 400 && echo 'OK' || echo 'ERR' 
# invalid get parameter
sleep 1s

curl http://localhost:9998/sqs_api/api.php?action=logout\&anything=else \
 -s -o /dev/null -w "%{http_code}" \
 --cookie cookie.txt \
 | grep -q 501 && echo 'OK' || echo 'ERR' 
# unnecessary extra get parameter
sleep 1s

curl http://localhost:9998/api.php?action=logout --cookie cookie.txt \
 -s -o /dev/null -w "%{http_code}" \
 | grep -q 200 && echo 'OK' || echo 'ERR' 
# logout successful 
sleep 1s

curl http://localhost:9998/api.php?action=logout --cookie cookie.txt \
 -s -o /dev/null -w "%{http_code}" \
 | grep -q 401 && echo 'OK' || echo 'ERR' 
# already logged out 
sleep 1s

#+---------------------------------------+--------+------+--------+--------+----------+
#| Register         POST                 |   *    |   *  |        |        |    *     |
#+---------------------------------------+--------+------+--------+--------+----------+
curl http://localhost:9998/api.php?action=register \
 -s -o /dev/null -w "%{http_code}" \
 --data "username=zxcvzxcv&password=asdfasdf" \
 | grep -q 401 && echo 'OK' || echo 'ERR' 
# username must be student number 
sleep 1s

curl http://localhost:9998/api.php?action=register\&username=zxcvzxcv\&password=asdfasdf \
 -s -o /dev/null -w "%{http_code}" \
 | grep -q 401 && echo 'OK' || echo 'ERR' 
# GET not supported  
sleep 1s

curl http://localhost:9998/api.php?action=register \
 -s -o /dev/null -w "%{http_code}" \
 --data "username=468299219&password=asdfasdf" \
 | grep -q 201 && echo 'OK' || echo 'ERR' 
# User Created 
sleep 1s

curl http://localhost:9998/api.php?action=register \
 -s -o /dev/null -w "%{http_code}" \
 --data "username=468299219&password=asdfasdf" \
 | grep -q 401 && echo 'OK' || echo 'ERR' 
# User Already Created 
sleep 1s

#+---------------------------------------+--------+------+--------+--------+----------+
#| isLoggedin       GET                  |   *    |   *  |        |        |    *     |
#+---------------------------------------+--------+------+--------+--------+----------+

curl http://localhost:9998/sqs_api/api.php?action=isloggedin\&anything=else \
 -s -o /dev/null -w "%{http_code}" \
 --cookie cookie.txt \
 | grep -q 501 && echo 'OK' || echo 'ERR' 
# unnecessary extra get parameter

#sleep 1s RATE LIMITED
curl http://localhost:9998/sqs_api/api.php?action=isloggedin \
 -s -o /dev/null -w "%{http_code}" \
 --cookie cookie.txt \
 | grep -q 429 && echo 'OK' || echo 'ERR' 
# rate limited 

sleep 1s
curl http://localhost:9998/sqs_api/api.php?action=isloggedin \
 -s -o /dev/null -w "%{http_code}" \
 --cookie cookie.txt \
 | grep -q 200 && echo 'OK' || echo 'ERR' 
# rate limited 

sleep 1s
curl http://localhost:9998/sqs_api/api.php?action=isloggedin \
 -s -o /dev/null -w "%{http_code}" \
 | grep -q 403 && echo 'OK' || echo 'ERR' 
# not logged in 

#+---------------------------------------+--------+------+--------+--------+----------+
#| userExists       GET                  |   *    |   *  |        |        |    *     |
#+---------------------------------------+--------+------+--------+--------+----------+

curl http://localhost:9998/sqs_api/api.php?action=isloggedin \
 -s -o /dev/null -w "%{http_code}" \
 --cookie cookie.txt \
 | grep -q 429 && echo 'OK' || echo 'ERR' 
# rate limited 
