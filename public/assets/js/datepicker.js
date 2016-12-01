$.fn.loadDate = function() {
    $(this).daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        timePicker: true,
        calender_style: "picker_4",
        locale: 'pt-br',
        locale: {
            format: 'DD/MM/YYYY h:mm',
            daysOfWeek: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'],
            monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
        }
    });
}