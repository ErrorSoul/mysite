$ ->
  #
  # Initialize Tips
  #

  $('[data-toggle="popover"]').popover()
  $('[data-toggle="tooltip"]').tooltip()

  $('.dropdown-toggle').dropdown()

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
  #

  $ ->
    $('.js-editor').editable inlineMode: false

  add_many_scans = ->
    $add_scans = $('.add_scans')

    $add_scans.on 'click', (e) ->
      e.preventDefault()
      filesGroup = $(@).siblings('.asset-group').last().clone()
      len = filesGroup.data().num
      filesGroup.find('input').each ->
        $(this).attr 'name', $(this).attr('name').replace(len, len + 1)
        $(this).val('')
      filesGroup.attr('data-num', len + 1)
      filesGroup.find('.datepickera').datetimepicker()
      console.log('len', len)
      $(@).before(filesGroup)

  add_many_scans()
