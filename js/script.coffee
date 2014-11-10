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


  # Get projects from JSON

  timelineUl = timeline.find('ul')
  items = []

  $.getJSON("projects.json").done( ( data ) ->
    $.each( data.items, ( i, item ) ->
      items.push(item)
      console.log item
      console.log i
      console.log items
    )

    $.each( items, ( i, item ) ->

      if items[i].type is "event"
        timelineUl.append(
          console.log 'event append'
          '<li class="group item"> <!-- Event -->
            <section class="col-6 col-tab-12 col-ph-12 row event">
              <div class="col-1 col-sm-2 col-ph-2 date">
                <p>' + items[i].year + '</p>
              </div>
              <div class="col-11 col-sm-10 col-ph-10 eventText">
                <h4 class="inlineBlock">' + items[i].title + '</h4>
              </div>
            </section>
          </li> <!-- event -->'
        )
      else if items[i].type is "project"
        timelineUl.append(
          console.log 'project append'
          '<li class="group item"> <!-- Project -->
            <section class="col-6 col-tab-12 col-ph-12 row project ">
              <div class="col-1 col-sm-2 col-ph-2 date">
                <p>' + items[i].year + '</p>
              </div>
              <figure class="col-7 col-sm-9 col-ph-9 thumb">
                <img src="' + items[i].img + '" alt="' + items[i].title + '"/>
                <figcaption>
                  <h4>Project scope:</h4>
                  <p>' + items[i].description + '</p>
                  <h4>My roles:</h4>
                  <ul></ul>
                </figcaption>
              </figure>
              <div class="col-4 col-sm-9 col-ph-9 info">
                <h3>' + items[i].title + '</h3>
                <ul class="extlinks inlineList"></ul>
                <ul class="skills"></ul>
              </div>
            </section>
          </li> <!-- project -->'
        )

        # Add project's external links
        for link in items[i].extLinks
          timelineUl.find('.extlinks:last').append(
            '<li><a href="' + link.url + '" target="_blank"><i class="fa fa-' + link.icon + '"></i></a></li>'
          )
        # Add project's skills
        for skill in items[i].skills
          timelineUl.find('.skills:last').append(
            '<li><span>' + skill + '</span></li>'
          )
      if items[i].scope is "online"
        timelineUl.find('.item:last').addClass('online')
      else
        timelineUl.find('.item:last').addClass('offline')
    )
  )

  # Onload animation

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

  # Birth icon appears
  setTimeout( ->
    appear $('.fa-certificate')
  , 400)
  setTimeout( ->
    appear $('.fa-bolt')
  , 1000)

  # Ribbon appears
  setTimeout( ->
    $('.ribbon').animate({
      opacity : 1,
      top     : 0
      }, 250)
  , 2400)

  # Timeline appears
  setTimeout( ->
    $('#timeline').animate({
      opacity : 1
    }, 800)
    appear $('header .longLink')
  , 3800)


  # Show projects and events one by one

  $.fn.reverse = [].reverse;
  setTimeout( ->
    listItems = $('#timeline > ul > li').reverse()
    listItems.each( (i) ->
      console.log i
      $(@).hide().delay(i*3400).slideDown(600)
    )
  , 5600)


  # Project image on hover

  $('.thumb').hover ->

    $( @ ).find('img').css('opacity','0.05').wrap('<div class="tint"></div>')
    $( @ ).find('figcaption').css('visibility','visible')

  , ->

    $( @ ).find('img').css('opacity','1').unwrap()
    $( @ ).find('figcaption').css('visibility','hidden')
