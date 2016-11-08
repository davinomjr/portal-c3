$.fn.loadDate = function() {
    $(this).daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        calender_style: "picker_4",
        format: 'DD/MM/YYYY',
        locale: 'pt-br',
        locale: {
            daysOfWeek: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'],
            monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
        }
    });
}