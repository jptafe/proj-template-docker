### Starter Template for API & APP development 

A pure PHP pure JS implementation of frontend and backend using microservice architecture with docker-compose

## Instructions

```
docker-compose up
chrome.exe --disable-web-security --disable-gpu --user-data-dir=~/chromeTemp http://localhost:9997
```
## URLS

# http://localhost:9999 - phpmyadmin backend
# http://localhost:9998/api.php - API should return error 400, because of API misuse 
# http://localhost:9997/ - html/css/js frontend  

## Prerequisites 

* Docker Desktop (windows & mac)
* CLI to start microservice architecture 

## TODO

* Put student numbers for current cohorts, including yours
* Modify database to include relations between student - class and student - comment and student - queueitem
* implement proper validation
* Move API codebase to SQS


## API Architecture
```

api.php             se.php              db.php
==========          ==========          ==========
main routing        security            sql interactions
                    restrictios 

http responses      session
                    managemnt

json output         data validation
```
