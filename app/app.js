document.getElementById('loginform').addEventListener('submit', function(e) {fetchlogin(e)});
document.getElementById('registerform').addEventListener('submit', function(e) {fetchregister(e)});
document.getElementById('accountexists').addEventListener('input', function(e) {fetchaccountexists(e)});
document.getElementById('linkisloggedin').addEventListener('click', function(e) {fetchisloggedin(e)});
document.getElementById('logoutbutton').addEventListener('click', function(e) {fetchlogout(e)});

function fetchlogin(evt) {
    evt.preventDefault()
    var fd = new FormData();
    fd.append('username', loginuser.value);
    fd.append('password', loginpass.value);
    fetch('http://localhost:9998/api.php?action=login', 
    {
        method: 'POST',
        body: fd,
        credentials: 'include'
    })
    .then(function(headers) {
        if(headers.status == 401) {
            console.log('login failed');
            localStorage.removeItem('csrf');
            localStorage.removeItem('color');
            localStorage.removeItem('icon');
            localStorage.removeItem('nick');
            localStorage.removeItem('theme');
            localStorage.removeItem('uid');
            return;
        }
        if(headers.status == 203) {
            console.log('registration required');
            // only need csrf
        }
        headers.json().then(function(body) {
            // BUG is this a 203 or 200?
            localStorage.setItem('csrf', body.Hash);
            localStorage.setItem('uid', loginuser.value);
            localStorage.setItem('csrf', body.Hash);
            localStorage.setItem('color', body.color);
            localStorage.setItem('icon', body.icon);
            localStorage.setItem('nick', body.nick);
            localStorage.setItem('theme', body.theme);
        })
    })
    .catch(function(error) {
        console.log(error)
    });
}
function fetchregister(evt) {
    evt.preventDefault();
    var fd = new FormData();
    fd.append('nick', regnick.value);
    fd.append('color', regcolor.value.substring(1)); //lop off # in hex code
    fd.append('icon', regicon.value);
    fd.append('pass', regpass1.value);
    fd.append('csrf', localStorage.getItem('csrf'));
    fetch('http://localhost:9998/api.php?action=register', 
    {
        method: 'POST',
        body: fd,
        credentials: 'include'
    })
    .then(function(headers) {
        if(headers.status == 400) {
            console.log('register failed');
            return;
        }
        if(headers.status == 201) {
            console.log('registration updated');
            return;
        }
    })
    .catch(error => console.log(error));
}
function fetchaccountexists(evt) {
    if(evt.srcElement.value.length > 3) {
        fetch('http://localhost:9998/api.php?action=accountexists&username='+ evt.srcElement.value, 
        {
            method: 'GET',
            credentials: 'include'
        })
        .then(function(headers) {
            if(headers.status == 204) {
                console.log('user does not exist');
                return;
            }
            if(headers.status == 400) {
                console.log('user exists');
                return;
            }
            headers.json().then(function(body) {
                console.log(body);
            })
        })
        .catch(error => console.log(error));
    }
}
function fetchisloggedin(evt) {
    fetch('http://localhost:9998/api.php?action=isloggedin', 
    {
        method: 'GET',
        credentials: 'include'
    })
    .then(function(headers) {
        if(headers.status == 403) {
            console.log('not logged in');
            localStorage.removeItem('csrf');
            localStorage.removeItem('color');
            localStorage.removeItem('icon');
            localStorage.removeItem('nick');
            localStorage.removeItem('theme');
            localStorage.removeItem('uid');
            return;
        }
        headers.json().then(function(body) {
            localStorage.setItem('csrf', body.Hash);
        })
    })
    .catch(error => console.log(error));
}
function fetchlogout(evt) {
    fetch('http://localhost:9998/api.php?action=logout', 
    {
        method: 'GET',
        credentials: 'include'
    })
    .then(function(headers) {
        if(headers.status != 200) {
            console.log('logout failed Server-Side, but make client login again');
        }
        localStorage.removeItem('csrf');
        localStorage.removeItem('color');
        localStorage.removeItem('icon');
        localStorage.removeItem('nick');
        localStorage.removeItem('theme');
        localStorage.removeItem('uid');    
    })
    .catch(error => console.log(error));
}