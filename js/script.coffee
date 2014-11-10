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
  appear $('.fa-certificate')
  setTimeout( ->
    appear $('.fa-bolt')
  , 600)

  # Ribbon appears
  setTimeout( ->
    $('.ribbon').animate({
      opacity : 1,
      top     : 0
      }, 250)
  , 1200)

  # TImeline appears
  setTimeout( ->
    $('#timeline').animate({
      opacity : 1
    }, 800)
  , 2000)


  # 2. Loading projects and events one by one

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
                <img src="' + items[i].img + '" alt="' + items[i].imgAlt + '"/>
                <figcaption>' + items[i].description + '</figcaption>
              </figure>
              <div class="col-4 col-sm-9 col-ph-9 info">
                <h3>' + items[i].title + '</h3>
                <ul class="extlinks inlineList"></ul>
                <ul class="skills"></ul>
              </div>
            </section>
          </li> <!-- project -->'
        )

        for link in items[i].extLinks
          timelineUl.find('.extlinks').append(
            '<li><a href="' + link.url + '" target="_blank"><i class="fa fa-' + link.name + '"></i></a></li>'
          )

        for skill in items[i].skills
          timelineUl.find('.skills').append(
            '<li><span>' + skill + '</span></li>'
          )

      if items[i].scope is "online"
        timelineUl.find('.item').addClass('online')
      else
        timelineUl.find('.item').addClass('offline')
    )
  )

  $.fn.reverse = [].reverse;

  setTimeout( ->

    listItems = $('#timeline > ul > li').reverse()

    listItems.each( (i) ->
      console.log i
      $(@).hide().delay(i*2000).fadeIn(1000)
    )

    ###for i in listItems.length
      console.log listItems.length
      $('#timeline > ul > li:hidden:last').hide().delay(i*2000).fadeIn(1500)###

  , 3500)


  # 3. Sides labels appear on the top
