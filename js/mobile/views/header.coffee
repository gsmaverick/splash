class Splash.Views.HeaderView extends Backbone.View
  template:
    headline: '#headline-template'
    button: '#header-button-template'
  
  events:
    'click .headline': 'click'
    'webkitTransitionEnd .headline': 'transitionEnd'
    'webkitTransitionEnd .btn': 'transitionEnd'
    'click .btn': 'btn'

  # List off all possible button images for the header
  images:
    'filter': 'margin: 5px 0 5px -1px;'
    'globe': ''
    'info': ''

  initialize: ->
    @headline_tmpl = Handlebars.compile(($ @template.headline).html())
    @button_tmpl = Handlebars.compile(($ @template.button).html())
    @
  
  # Updates the state of the header and does a sliding animation.  It lets the
  # application router take care of determining the direction of the slide.
  update: (title, dir, buttons = []) =>
    @dir = dir
    @$el.children().addClass 'old-' + @dir + ' animatable'

    # Render the new contents of the header      
    @$el.append @headline_tmpl
      'headline': title
      'dir': @dir
      'num': ['zero', 'one', 'two'][buttons.length]
    
    for btn, i in buttons
      @$el.append @button_tmpl
        'dir': @dir
        'name': btn
        'style': @images[btn]
        'num': ['one', 'two'][i]

    # Perform the animation via the use of webkit transformation
    setTimeout @slide, 1

    return

  # When clicking the headline bar go back in the history unless we're on the
  # index action in which case it does nothing.
  click: (e) ->
    if Backbone.history.fragment != ""
      window.history.go(-1)
  
  # Start the transition for any new elements that should be animated onto the
  # visible portion of the header.
  slide: =>
    ($ '.new-' + @dir).each (i, elem) =>
      el = ($ elem)
      el.removeClass 'new-' + @dir if el.hasClass 'new-' + @dir
  
  # Delete any old elements once they are done with their transition.
  transitionEnd: (e) ->
    target = ($ e.target)

    if target.hasClass 'old-' + @dir
      target.remove()
  
  btn: (e) =>
    e.preventDefault()

    name = ($ e.currentTarget).data 'name'
    Splash.Vent.trigger 'header:button:click', name
    
    false