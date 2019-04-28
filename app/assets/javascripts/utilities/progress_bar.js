document.addEventListener('turbolinks:load', function() {
    var myBar = document.querySelector('.my-bar')

    if (myBar){
        var questionsAmount = document.querySelector('.my-progress').dataset.questionsAmount
        var question = myBar.dataset.question

        if (question > 1) {
            var width = ( question - 1 ) / questionsAmount * 100
            myBar.style.width = width + '%'
        }
    }
})