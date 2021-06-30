$(document).ready(function () {

    $('.btn-danger').prop('disabled', true);

    var timeCounter = new Array($('tbody tr').length);

    for (var i = 0; i < timeCounter.length; i++) {
        timeCounter[i] = 0;
    }

    var handler = null;

    function startTimer() {
        var row = $(this).closest('tr');
        var index = row.index();
        var el = $(row.find('td>label'));

        $('.btn-primary').prop('disabled', true);
        $(row.find('.btn-danger')).prop('disabled', false);

        startTime = (new Date()).getTime();
        handler = setInterval(function () { showTime(el, index) }, 1000);

    }
    function showTime(el, index) {

        var seconds = timeCounter[index] % 60;
        var minutes = Math.floor(timeCounter[index] / 60) % 60;
        var hours = Math.floor(timeCounter[index] / 3600);

        formatTime(el[3], seconds);
        formatTime(el[2], minutes);
        formatTime(el[1], hours);

        timeCounter[index]++;

    }
    function formatTime(label, number) {
        if (number < 10) {
            $(label).text("0" + number);
        }
        else {
            $(label).text(number);
        }
    }
    function stopTimer() {
        $('.btn-primary').prop('disabled', false);
        $(this).prop('disabled', true);
        clearInterval(handler);

    }
    $('.btn-primary').click(startTimer);

    $('.btn-danger').click(stopTimer);

});