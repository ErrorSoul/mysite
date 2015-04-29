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

  #
  # editor
  #

  $ ->
    $('.js-editor').editable inlineMode: false

  add_many_scans = ->
    $add_scans = $('.add_scans')

    $add_scans.on 'click', (e) ->
      e.preventDefault()
      class_name = '.' + $(@).data()['scans']
      filesGroup = $(@).closest('.form-group')
      quantity  = filesGroup.find(':file').last().data()['num']
      template = filesGroup.find(':file').last().clone()
      template[0].name = template[0].name.replace quantity, quantity + 1
      template.data('num', quantity + 1)
      $(@).before(template.val(''))

  add_many_scans()
