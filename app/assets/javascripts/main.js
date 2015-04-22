$(document).ready(function(){
    loadOutta();
    tabs();

    $(".slides").owlCarousel({
        slideSpeed : 300,
        paginationSpeed : 400,
        items: 1,
        loop: true
    });

    $(".cotrollr").on("click", function(event){
        $(".owl-next").click();
        event.preventDefault()
    })

  if($('nav.yellbox-js').length) {
    $('nav.yellbox-js').on('click','li',function(){
      var el = $(this);
      $('nav.yellbox-js').find('li').removeClass('active');
      el.addClass('active');
    });
  }
  if($('nav.leftbc').length) {
    $('nav.leftbc .inner').hover(
        function(){
          var el = $(this);
          $('nav.leftbc').find('.inner').removeClass('active');
          el.addClass('active');
        },
        function(){
          var el = $(this);
          el.removeClass('active');
        }
    );
  }
  if($('.accordion').length) {
    $('.accordion').on('click', '.accordion-title', function(){
      $(this).closest('.accordion-block').toggleClass('active');
    })
  }
  $(".fancybox").fancybox();
  $("form").validate();
  $('.attr input[name="phone"]').inputmask("phone", {

  });
})

$(window).load(function(){
  initTimelines();
});

$(window).resize(function(){
  initTimelines();
})

function loadOutta() {
    if ($('.load_me_im').length) {
        $('.load_me_im').each(function(){
            $(this).css({
                "backgroundImage": "url('" + $(this).data("bg") + "')"
            });
        })
    }
}
function tabs() {
  if($('.tabs').length) {
    $('.tabs').find('li').on('click', function(){
      var el = $(this);
      el.siblings('li').removeClass('active');
      el.addClass('active');
      var id = el.closest('.tabs').attr('data-target');
      var tabs = $('.tabs-container[data-id="'+id+'"] > .tab');
      tabs.removeClass('active').eq(el.index()).addClass('active')
    });
  }
}

function initTimelines() {
  var w = $(".container").width(),
      iw = parseInt(w/3),
      tls = $(".timelines"),
      tlsWrap = $(".timeline_slide");

  tlsWrap.mCustomScrollbar("destroy");

  tls.each(function(){
    var itms = $(this).find(".timeline_item");
    itms.width(iw - 50);
    $(this).width(iw*(itms.length));
  })

  tlsWrap.mCustomScrollbar({
    axis:"x",
    setWidth: "100%",
    autoDraggerLength: false,
    mouseWheel:{ scrollAmount: 200}
  });
}

jQuery.validator.setDefaults({
  highlight: function(element, errorClass) {
    $(element).closest('.form_element').addClass('has-error');
  },
  unhighlight: function(element, errorClass) {
    $(element).closest('.form_element').removeClass('has-error');
  },
  errorPlacement: function(error, element) {
    error.addClass('control-label').appendTo( element.parent() );
    error.on('click',function(){
      error.remove();
      element.trigger('focus');
    });
    element.on('focus keyup',function(){
      error.remove();
    });
  },
  submitHandler: function(form) {
    //$(form).submit();
    $.fancybox.open({href : '#complete'});
  },
  rules: {
    email: {
      required: true,
      pattern: "[a-zA-Z0-9._%-]+@[a-zA-Z0-9-]+(\\.[a-zA-Z]{2,})+"
    },
    name: {
      required: true,
      minlength: 3
    },
    company: {
      required: true,
      minlength: 3
    },
    msg: {
      required: true,
      minlength: 3
    },
    phone: {
      required: true
    }
  },
  messages: {
    email: {
      pattern: "Формат email не корректный. Адрес должен содержать адрес пользователя, символ @ и доменную зону",
      required: "Пожалуйста, введите email адрес"
    },
    name: {
      required: "Не заполнено"
    },
    company: {
      required: "Не заполнено"
    },
    phone: {
      required: "Не заполнено"
    },
    msg: {
      required: "Не заполнено"
    }
  }
});

jQuery.extend($.inputmask.defaults, {
  "oncomplete": function(){
    $(this).closest('.form_element').removeClass('has-error');
  },
  "onincomplete": function(){
    $(this).closest('.form_element').addClass('has-error');
    var error = $('<label id="'+this.name+'-error" class="error" for="'+this.name+'">Не заполнено</label>')
    error.addClass('control-label').appendTo(  $(this).parent() );
    error.on('click',function(){
      error.remove();
      $(this).trigger('focus');
    });
    $(this).on('focus keyup',function(){
      error.remove();
    });
  },
  "oncleared": function(){
     $(this).closest('.form_element').addClass('has-error');
      var error = $('<label id="'+this.name+'-error" class="error" for="'+this.name+'">Не заполнено</label>')
    error.addClass('control-label').appendTo(  $(this).parent() );
    error.on('click',function(){
      error.remove();
      $(this).trigger('focus');
    });
    $(this).on('focus keyup',function(){
      error.remove();
    });
  }
});