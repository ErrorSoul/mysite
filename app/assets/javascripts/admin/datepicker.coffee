$ ->
  #----------------------------------------------------------------------------
  #                           Definition Section
  #----------------------------------------------------------------------------

  class DatePicker
    @datepicker: '.datepickera'
    @options: {
      locale: 'ru',
      format: 'DD.MM.YYYY HH:MM',
      showTodayButton: true,
      showClear: true,
      calendarWeeks: true,
      useStrict: true
    }

    @process: =>
      @bindDatePicker()
      @setProperInputValue()

    @bindDatePicker: =>
      $(@datepicker).datetimepicker @options

    @setProperInputValue: =>
      $.each $('input.datepickera'), (index, input) ->
        date = $(input).attr 'value'

        if date
          $(input).data('DateTimePicker').date moment(date)

  #----------------------------------------------------------------------------
  #                               Exec Section
  #----------------------------------------------------------------------------

  DatePicker.process()
