$.fn.loadDate = function() {
    $(this).daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        timePicker: true,
        timePicker24Hour: true,
        calender_style: "picker_4",
        autoUpdateInput: true,
        autoApply: true,
        locale: 'pt-BR',
        format: 'DD/MM/YYYY HH:mm',
        locale: {
            format: 'DD/MM/YYYY HH:mm',
            daysOfWeek: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'],
            monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
        }
    });

    $(this).on("apply.daterangepicker", function(ev, picker) {
        $(this).attr("value", $(this).val());
        $(this).trigger("change");
    });
}