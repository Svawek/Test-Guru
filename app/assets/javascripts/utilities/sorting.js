document.addEventListener('turbolinks:load', function() { // ждем пока загрзится страница
    var control = document.querySelector('.sort-by-title') // выбираем все элементы с классом sort-by-title
    if (control) {control.addEventListener('click', sortRowsByTitle)} // после клика на элемент запускается функция sortRowsByTitle, если control сучествует, то будем вешать обработчик событий
})
function sortRowsByTitle() {
    var table = document.querySelector('table') //находим таблицу нужную
    //NodeList
    var rows = table.querySelectorAll('tr') // находим все строки
    var sortedRows = []

    for (var i = 1; i < rows.length; i++) {
        sortedRows.push(rows[i]) //все строки переместим в sortedRows для дальнейшей сортировки кроме заголовка
    }

    if (this.querySelector('.octicom-arrow-up').classList.contains ('hide')){
        sortedRows.sort(CpnpareRowsAsc)
        this.querySelecor('.octicon-arrow-up').classList.remove('hidde')
        this.querySelecor('.octicon-arrow-down').classList.add('hidde')
    } else {
        sortedRows.sort(CpnpareRowsDesc)
        this.querySelecor('.octicon-arrow-up').classList.remove('hidde')
        this.querySelecor('.octicon-arrow-down').classList.add('hidde')
// проверяет есть ли в классе octicom-arrow-up, а в нем класс hide. и потом выбирает сортировку
    }

    var sortedTable = document.createElement('table')
    sortedTable.classList.add('table') // создаем новую таблицу
    sortedTable.appendChild(rows[0]) // помещаем зоголовок в новую таблицу

    for(var i = 0; i < sortedRows.length; i++) {
        sortedTable.appendChild(sortedRows[i]) // добавляем в новую таблицу отсортированные строки
    }

    table.parentNode.replaceChild(sortedTable, table) // убираем старую таблицу со страницы и рендерим новую
}
function compareRowsAsc(row1, row2) {
    var testTitle1 = row1.querySelector('td').textContent
    var testTitle1 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) {return -1}
    if (testTitle1 > testTitle2) {return 1}
    return 0
}

function compareRowsDesc(row1, row2) { //
    var testTitle1 = row1.querySelector('td').textContent
    var testTitle1 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) {return 1}
    if (testTitle1 > testTitle2) {return -1}
    return 0
}


.hide {
    display: none;
}
