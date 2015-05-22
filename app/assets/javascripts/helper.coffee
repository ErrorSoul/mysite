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
      class_name = '.' + $(@).data()['scans']
      filesGroup = $(@).siblings()
      name_clone = filesGroup.last().clone()
      name_clone.find('.btn').remove()
      name_input = name_clone.find("input")
      quantity   = name_input.last().data()['num']
      name_clone.attr("name", quantity + 1)
      name_input[0].name = name_input[0].name.replace(quantity, quantity + 1)
      name_input.attr('data-num', quantity + 1)
      name_input.val('')

      files_Group = filesGroup.siblings('.asset_class')
      asset_clone = files_Group.last().clone()
      asset_clone.find('.btn').remove()
      asset_input = asset_clone.find("input")
      quantity   = asset_input.last().data()['num']
      asset_input[0].name = asset_input[0].name.replace(quantity, quantity + 1)
      asset_input.attr('data-num', quantity + 1)
      name_input.val('')

      $(@).before(asset_clone)
      $(@).before(name_clone)

  add_many_scans()
