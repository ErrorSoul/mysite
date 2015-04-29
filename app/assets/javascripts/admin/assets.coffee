$ ->
  #----------------------------------------------------------------------------
  #                           Definition Section
  #----------------------------------------------------------------------------

  class Scan
    @addLink: '.js-add-scan'
    @container: '.fileinput'

    @process: ->
      @bindFileClick()
      @bindFileChange()
      @bindAddClick()

    @bindFileClick: ->
      container = @container + ' .form-control'

      $(document).on 'click', container, (e) =>
        $(e.target).closest(@container).find(':file').click()

    @bindFileChange: ->
      fileInput = @container + ' :file'

      $(document).on 'change', fileInput, (e) =>
        container = $(e.target).closest(@container)

        container.find('.fileinput-filename').text $(e.target).val()
        container.addClass('fileinput-exists').removeClass 'fileinput-new'

    @bindAddClick: ->
      $(@addLink).on 'click', (e) =>
        e.preventDefault()

        template = $(e.target).closest('.form-group').find(@container).last().clone()
        currentIndex = parseInt template.attr('data-index')
        nextIndex = currentIndex + 1
        fileInput = template.find ':file'
        fileName = template.find '.fileinput-filename'

        fileInput[0].name = fileInput[0].name.replace currentIndex, nextIndex
        template.removeClass('fileinput-exists').addClass 'fileinput-new'
        template.attr 'data-index', nextIndex
        fileInput.val ''
        fileName.text ''

        $(e.target).before template

  #----------------------------------------------------------------------------
  #                               Exec Section
  #----------------------------------------------------------------------------

  Scan.process()
