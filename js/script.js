$(document).ready(function(){

  /* Toggle button */

  var timeline = $('#timeline');
  var toggleTop = $("#toggleTop");
  var toggleBottom = $("#toggleBottom");
  var online = $('.online');
  var offline = $('.offline');

  toggleTop.change(function() {
    if(this.checked) {
      toggleBottom.prop('checked', true);
      timeline.removeClass('showOnline', 300)
        .removeClass('hideOffline', 300);
      online.fadeOut(300, function(){
        offline.fadeIn(300);
        timeline.addClass('showOffline', 300);
      });
      timeline.addClass('hideOnline', 300);

    } else {
      toggleBottom.prop('checked', false);
      timeline.removeClass('showOffline', 300)
        .removeClass('hideOnline', 300);

      offline.fadeOut(300, function(){
        online.fadeIn(300);
        timeline.addClass('showOnline', 300);
      });
      timeline.addClass('hideOffline', 300);
    }
  });

  toggleBottom.change(function() {
    if(this.checked) {
      toggleTop.prop('checked', true);
      timeline.removeClass('showOnline', 300)
        .removeClass('hideOffline', 300);
      online.fadeOut(300, function(){
        offline.fadeIn(300);
        timeline.addClass('showOffline', 300);
      });
      timeline.addClass('hideOnline', 300);

    } else {
      toggleTop.prop('checked', false);
      timeline.removeClass('showOffline', 300)
        .removeClass('hideOnline', 300);

      offline.fadeOut(300, function(){
        online.fadeIn(300);
        timeline.addClass('showOnline', 300);
      });
      timeline.addClass('hideOffline', 300);
    }
  });


  /* Project image on hover */

  $('.thumb').hover(
    function() { // on hover

      $( this ).find('img').css('opacity','0.05')                  // making image transparent
               .wrap('<div class="tint"></div>');                  // wrap in div with white background class
      $( this ).find('figcaption').css('visibility','visible');    // showing project description

    }, function() { // reverse all

      $( this ).find('img').css('opacity','1')
               .unwrap();
      $( this ).find('figcaption').css('visibility','hidden');
    });

});
