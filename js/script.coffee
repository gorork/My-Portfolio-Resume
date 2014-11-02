$(document).ready ->

  # Toggle button

  timeline = $('#timeline')
  toggleTop = $("#toggleTop")
  toggleBottom = $("#toggleBottom")
  online = $('.online')
  offline = $('.offline')

  toggleTop.change ->

    if @.checked
      toggleBottom.prop 'checked', true

      timeline.removeClass 'showOnline', 300
        .removeClass 'hideOffline', 300

      online.fadeOut(300, ->
        offline.fadeIn 300
        timeline.addClass 'showOffline', 300)

      timeline.addClass 'hideOnline', 300

    else
      toggleBottom.prop 'checked', false

      timeline.removeClass 'showOffline', 300
      .removeClass 'hideOnline', 300

      offline.fadeOut(300, ->
        online.fadeIn 300
        timeline.addClass 'showOnline', 300)

      timeline.addClass 'hideOffline', 300


  toggleBottom.change ->

    if this.checked
      toggleTop.prop 'checked', true

      timeline.removeClass 'showOnline', 300
        .removeClass 'hideOffline', 300

      online.fadeOut(300, ->
        offline.fadeIn 300
        timeline.addClass 'showOffline', 300)

      timeline.addClass 'hideOnline', 300

    else
      toggleTop.prop 'checked', false

      timeline.removeClass 'showOffline', 300
        .removeClass 'hideOnline', 300

      offline.fadeOut(300, ->
        online.fadeIn 300
        timeline.addClass 'showOnline', 300)

      timeline.addClass 'hideOffline', 300


  # Project image on hover

$('.thumb').hover ->

    $( @ ).find('img').css('opacity','0.05').wrap '<div class="tint"></div>'
    $( @ ).find('figcaption').css('visibility','visible')

  , ->

    $( @ ).find('img').css('opacity','1').unwrap()
    $( @ ).find('figcaption').css('visibility','hidden')
