var check = function() {
    if (document.getElementById('password').value ===
        document.getElementById('confirm_password').value) {
        document.getElementById('message').style.color = 'green';
        document.getElementById('message').innerHTML = 'Пароли совпадают';
    }else if (document.getElementById('password').value.length < 8) {
        document.getElementById('message').style.color = 'red';
        document.getElementById('message').innerHTML = 'Пароль должен быть не меньше 8 символов '
    } else {
        document.getElementById('message').style.color = 'red';
        document.getElementById('message').innerHTML = 'Не совпадает пароль';
    }
}