var check = function() {
    if (document.getElementById('password').value ===
        document.getElementById('confirm_password').value) {
        document.getElementById('message').style.color = 'green';
        document.getElementById('message').innerHTML = 'Пароли совпадают';
    } else {
        document.getElementById('message').style.color = 'red';
        document.getElementById('message').innerHTML = 'Не совпадает пароль';
    }
}

function validateForm() {
    var username = document.forms["userForm"]["username"].value;
    var email = document.forms["userForm"]["email"].value;
    var dateOfBirth = document.forms["userForm"]["dateOfBirth"].value;
    var password = document.forms["userForm"]["password"].value;
    var confirm_password = document.forms["userForm"]["confirm_password"].value;
    if (username === "" ||
        email === "" ||
        dateOfBirth === "" ||
        password === "" ||
        confirm_password === "") {
        document.getElementById('message').innerHTML = 'Заполните все поля';
        return false;
    }if (document.getElementById('password').value.length < 8) {
        document.getElementById('message').style.color = 'red';
        document.getElementById('message').innerHTML = 'Пароль должен быть не меньше 8 символов'
        return false;
    }
    if (document.getElementById('password').value !==
        document.getElementById('confirm_password').value) {
        document.getElementById('message').style.color = 'red';
        document.getElementById('message').innerHTML = 'Не совпадает пароль';
        return false;
    }
}
function loginForm(){
    var username = document.forms["logForm"]["username"].value;
    var password = document.forms["logForm"]["password"].value;
    if (username === "" ||
        password === ""){
        document.getElementById('message').innerHTML = 'Заполните все поля';
        return false;
    }
}