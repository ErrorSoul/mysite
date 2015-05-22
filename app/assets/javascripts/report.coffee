$ ->
  
  $("form#new_report").bind("ajax:success", (event, xhr, settings) ->
    console.log(xhr, "JSON RESPONSE")
    if xhr['errors']
      $.map(xhr["errors"], (v, k) ->
        
        console.log(v, k)
        $("#report_#{k}").removeClass('has-error')
        find_p = $("#report_#{k}").closest('.attr').find('p')
        console.log(find_p, 'find_p')
        if find_p.length > 0
          find_p.html("")
        $("#report_#{k}").addClass('has-error')
        if find_p.length > 0
          find_p.html("#{v}")
        else
          $("#report_#{k}").closest('.attr').append("<p class='text-danger'> #{v} </p>")
    
      )
    else
      $(this).html('<h1 class="center-text"> Спасибо за вашу заявку <h1>')
      
    
    
  ).bind("ajax:error", (event, xhr, settings, exceptions) ->
    console.log(xhr, "ERRR RESPONSE")
    error_messages =  if xhr.responseJSON['errors']
      $.map(xhr.responseJSON["errors"], (v, k) ->
        console.log(v, k)
        $("#form_#{k}").removeClass('has-error')
        find_p = $("#form_#{k}").find('p')
        if find_p.length > 0
          find_p.html("")
        $("#form_#{k}").addClass('has-error')
        if find_p.length > 0
          find_p.html("#{v}")
        else
          $("#form_#{k}").append("<p class='text-danger'> #{v} </p>")
      )
    else
      console.log("<div class='col-sm-3 alert alert-danger pull-left'>Unknown error</div>")

    #$('.modal-footer').html(error_messages)
  )
