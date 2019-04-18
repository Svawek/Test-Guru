var check = function () {
    var pass = document.getElementById('user_password')
    var passConfirm = document.getElementById('user_password_confirmation')
    passConfirm.style.borderColor = 'initial'

    if (passConfirm.value.length > 0) {
        if (pass.value == passConfirm.value) {
            return passConfirm.style.borderColor = 'green'
        } else {
            return passConfirm.style.borderColor = 'red'
        }
    }
}
