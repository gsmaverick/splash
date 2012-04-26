# Main application router for Splash.  All route handlers only do enough to 
# hydrate the application state if necessary and then display the relevant view.
class Splash.Routers.Router extends Backbone.Router
  routes:
    '':                  'index'
    'place/:id':         'place'
    'search':            'search'
    'search/:query':     'search'
    'search/:query/map': 'map'
    'about':             'about'
    ':frag':             'error'
    
  
  # Links to a Backbone.View object linked to the current view being displayed.
  # This is used to determine the direction of slide the required to show the
  # new view.
  currentView: null

  # Track a new pageview and other events to Google Analytics.
  _trackPageview: ->
    return
  
  # Updates the contents of the application container and the status of the 
  # header bar.  It also determines the direction of the sliding action.
  _updateContent: (newView) =>
    Debug 'Splash.Routers.Router._updateContent'

    return if newView == @currentView

    if @currentView?
      # If there is a current view we need to determine the direction in which
      # we should slide off the current view and which direction to slide in the
      # new view.
      if @currentView._ident == 'about'
        dir = 'ltr'
      else if @currentView._ident == 'search' and newView._ident == 'index'
        dir = 'ltr'
      else if @currentView._ident == 'search' and newView._ident == 'detail'
        dir = 'rtl'
      else if @currentView._ident == 'detail' and newView._ident == 'search'
        dir = 'ltr'
      else
        dir = 'rtl'
    else if newView._ident == 'about'
      dir = 'ltr' # Some weird animation bug here
      # TODO: find out why this screen doesn't work properly
    else
      dir = 'rtl'
    
    # Delete if the current view if necessary and load the new one
    @currentView.destruct dir if @currentView?
    state = newView.getHeaderState()
    @header.update state.headline, dir, state.buttons
    newView.construct ($ '#content'), dir
    @currentView = newView

    return

  initialize: ->
    @bind 'all', @_trackPageview
    # Bind to the header element that already exists in the DOM and attach a
    # Backbone View to it.
    @header = new Splash.Views.HeaderView
      el: '#header'
  
  # Route handlers
  index: ->
    view = new Splash.Views.Index
    view.render()
    @_updateContent view
    return
  
  about: ->
    view = new Splash.Views.AboutView
    view.render()
    @_updateContent view
  
  # The this route will not be triggered by a search but allows an easy way to
  # represent the results of a particular query.
  # *query* {String} - User provided query string
  search: (query) ->
    view = new Splash.Views.SearchView
      q: query
    view.render()
    @_updateContent view
  
  # Displays the details screen for a particular place in the database.
  place: (id) ->
    view = new Splash.Views.DetailView
      place: id
    view.render()
    @_updateContent view
  
  # Handles a route that is not matched against a defined route handler.
  # *frag* {String} - URL fragment that didn't match a route handler
  error: (frag) ->
    Debug 'Splash.Routers.Router.error'
    Debug 'Route Not Found: ' + frag
    return



$ ->
  window.__DEBUG__ = true
  Splash.Data.Router = new Splash.Routers.Router
  Backbone.history.start()