$(document).ready(function(){
    loadOutta();
    tabs();

    $(".slides").owlCarousel({
        slideSpeed : 300,
        paginationSpeed : 400,
        items: 1,
        loop: true,
	navigation : true,
	theme : "owl-theme"
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

  //tlsWrap.mCustomScrollbar("destroy");

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



