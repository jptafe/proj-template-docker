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
        console.log(headers)
        headers.json().then(function(body) {
            console.log(body);
        })
    })
    .catch(function(error) {
        console.log(error)
    });
}
function fetchregister(evt) {
    evt.preventDefault();
    var fd = new FormData();
    fd.append('username', loginuser.value);
    fd.append('password', loginpass.value);
    fd.append('email', regemail.value);
    fd.append('phone', regphone.value);
    fetch('http://localhost:9998/api.php?action=register', 
    {
        method: 'POST',
        body: fd,
        credentials: 'include'
    })
    .then(headers => console.log(headers),
        headers.json().then(body => console.log(body)))
    .catch(error => console.log(error));
}
function fetchaccountexists(evt) {
    if(evt.srcElement.value.length > 3) {
        fetch('http://localhost:9998/api.php?action=accountexists&username='+ evt.srcElement.value, 
        {
            method: 'GET',
            credentials: 'include'
        })
        .then(headers => console.log(headers),
            headers.json().then(body => console.log(body)))
        .catch(error => console.log(error));
    }
}
function fetchisloggedin(evt) {
    fetch('http://localhost:9998/api.php?action=isloggedin', 
    {
        method: 'GET',
        credentials: 'include'
    })
    .then(headers => console.log(headers),
        headers.json().then(body => console.log(body)))
    .catch(error => console.log(error));
}
function fetchlogout(evt) {
    fetch('http://localhost:9998/api.php?action=logout', 
    {
        method: 'GET',
        credentials: 'include'
    })
    .then(headers => console.log(headers),
        headers.json().then(body => console.log(body)))
    .catch(error => console.log(error));
}