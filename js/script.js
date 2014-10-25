$(document).ready(function(){

  /* Toggle button */

  var timeline, toggleTop, toggleBottom, online, offline;

  timeline = $('#timeline');
  toggleTop = $("#toggleTop");
  toggleBottom = $("#toggleBottom");
  online = $('.online');
  offline = $('.offline');

  toggleTop.change(function() {                                      // when top toggle is switched
    if(this.checked) {                                               // if toggle is switched to Offline
      toggleBottom.prop('checked', true);

      timeline.removeClass('showOnline', 300)
        .removeClass('hideOffline', 300);

      online.fadeOut(300, function(){
        offline.fadeIn(300);
        timeline.addClass('showOffline', 300);
      });

      timeline.addClass('hideOnline', 300);

    } else {                                                         // if toggle is switched to Online
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

  toggleBottom.change(function() {                                  // when bottom toggle is switched
    if(this.checked) {                                              // if toggle is switched to Offline
      toggleTop.prop('checked', true);
      timeline.removeClass('showOnline', 300)
        .removeClass('hideOffline', 300);
      online.fadeOut(300, function(){
        offline.fadeIn(300);
        timeline.addClass('showOffline', 300);
      });
      timeline.addClass('hideOnline', 300);

    } else {                                                        // if toggle is switched to Online
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
