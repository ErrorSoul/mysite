$('.datepicker').datetimepicker();
$.each $('input.datepicker'), (index, input) ->
  date = $(input).attr 'value'

  if date
    $(input).data('DateTimePicker').date moment(date)
