document.addEventListener('turbolinks:load', function() {
    var controls = document.querySelectorAll('.form-inline-link')
    // выбираем все ссылки Edit

    if (controls.length) {
        for (var i = 0; i < controls.length; i++) {
            controls[i].addEventListener('click', formInlineLinkHandler)
        }
        // вешаем событие click на все ссылки выбранные
    }
    var errors = document.querySelector('.resource-errors')

    if (errors) {
        var resourceId = errors.dataset.resourceId
        formInlineHandler(resourceId)
    }
    // если есть ошибка, то при обновлении увидим форму для редактирования теста, на котором была ошибка
})

function formInlineLinkHandler(event) {
    event.preventDefault()
    //убираем стандартное поведение для ссылки

    var testId = this.dataset.testId
    formInlineHandler(testId)
}

function formInlineHandler(testId) {
    var link = document.querySelector('.form-inline-link[data-test-id = "' + testId + '"]')
    var testTitle = document.querySelector('.test-title[data-test-id = "' + testId + '"]')
    var formInline = document.querySelector('.form-inline[data-test-id = "' + testId + '"]')
    console.log(testTitle)

    if (formInline.classList.contains('hide')) {
        testTitle.classList.add('hide')
        formInline.classList.remove('hide')
        link.textContent = 'Cancel'
    } else {
        testTitle.classList.remove('hide')
        formInline.classList.add('hide')
        link.textContent = 'Edit'
    }
}
