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

    $( @ ).find('img').css('opacity','0.05').wrap('<div class="tint"></div>')
    $( @ ).find('figcaption').css('visibility','visible')

  , ->

    $( @ ).find('img').css('opacity','1').unwrap()
    $( @ ).find('figcaption').css('visibility','hidden')


  # Onload animation

  # 1. Birth icon appears + lightning + timeline shifting up
  appear = (elem) ->
    elemFontSize = elem.css 'fontSize'
    elem.animate({
      opacity: 1,
      fontSize: parseInt(elemFontSize) * 1.2
    }, 300, =>
      elem.animate({
          fontSize: elemFontSize
        }, 100
      )
    )

  appear $('.fa-certificate')

  setTimeout( ->
    appear $('.fa-bolt')
  , 600)

  setTimeout( ->
    $('.ribbon').animate({
      opacity : 1,
      top     : 0
      }, 250)
  , 1200)

  setTimeout( ->
    $('#timeline').animate({
      opacity : 1
    }, 1500)
  , 2000)


  # 2. Loading projects and events one by one

  # 3. Sides labels appear on the top
