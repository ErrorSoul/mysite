$ ->
  #
  # Initialize Tips
  #
  $('[data-toggle="popover"]').popover()
  $('[data-toggle="tooltip"]').tooltip()

  #
  # Submit form via js
  #
  $('.js-submit').on 'click', (e) ->
    e.preventDefault()

    form = if $(@).data 'form'
      $(@).data 'form'
    else
      $(@).closest 'form'

    $(form).submit()


  $ ->
    $('.js-editor').editable inlineMode: false
