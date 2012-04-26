class Splash.Views.SearchView extends Backbone.Screen
  tagName: 'div'
  className: 'screen'

  _ident: 'search'

  # All templates required for this screen
  template:
    base:   '#search-view-template'
    hint:   '#hint-view-template'
    result: '#result-view-template'
    marker: '<div class="result_marker">{{num}} Results</div>'

  events:
    'click #q': 'show'
    'blur #q':  'hide'
    'click .hint': 'hint'
    'submit form': 'submit'
    'click .result': 'result'
  
  initialize: ->
    Splash.Vent.bind 'header:button:click', @buttonClicked
    @
  
  # Returns the desired header options for this screen
  getHeaderState: ->
    headline: 'Search'
    buttons: ['globe', 'filter']

  render: =>
    tmpl = Handlebars.compile ($ @template.base).html()
    ($ @el).html tmpl()

    # TODO: Showing hints for last 3 queries
    @
  
  show: =>
    (@$ '.hint').show()
    return

  hide: =>
    (@$ '.hint').hide()
    return
  
  # Resets any results filters that were set.
  # TODO: Implement
  resetFilters: =>
    return
  
  # Display the results of the current query and any filters.
  results: =>
    tmpl = Handlebars.compile ($ @template.result).html()

    (@$ '.result').remove()
    (@$ '.result_marker').remove()
    @hide()

    obj =
      id: 1
      type: 'beach'
      name: 'Valens Conservation Area'
      address: '1691 Regional Road 97 (R.R.#6), Flamborough'
      num: '3'
    
    res = [obj, obj, obj, obj]

    # Add the result marker
    marker = Handlebars.compile @template.marker

    (@$ '.results').before marker {'num': res.length}
    for result in res
      (@$ '.results').append tmpl result

    return
  
  hint: (e) =>
    target = ($ e.currentTarget)

    # User wants to center map/results on current location.  This fires off a 
    # call to the Google reverse geocoder.
    if target.hasClass 'img'
      Debug 'Splash.Views.SearchView.hint Get User Location'
    else
      # This is a previously stored search query so update the current query
      # status and display appropriate results.
      @query = target.html()
      @resetFilters()
      @results()
    
    return
  
  submit: (e) =>
    e.preventDefault()
    @query = (@$ '#q').val()
    @resetFilters()
    @results()
    false
  
  result: (e) =>
    place_id = ($ e.currentTarget).data 'id'
    Splash.Data.Router.navigate 'place/' + place_id, {trigger: true}
  
  buttonClicked: (name) =>
    @toggleFilters() if name == 'filter'
    @showMap() if name == 'globe'
  
  toggleFilters: =>
    Debug 'Splash.Views.SearchView.showFilters'
    return
  
  # Show results on a map instead of in a list format.
  showMap: =>
    Debug 'Splash.Views.SearchView showMap'
    return