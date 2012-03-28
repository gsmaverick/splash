class Splash.Views.AdvancedSearchView extends Backbone.View
  el: '#advanced'

  events:
    'click .item': 'change'
    'click .filter': 'filter'
    'click .cancel': 'cancel'
  
  cancel: (e) =>
    e.preventDefault()
    # Clear any filtering
    @$el.slideUp('fast')
  
  # Radio button like functionality for the mutual exclusivity selectors
  change: (e) =>
    target = $(e.target)
    target.siblings().removeClass 'active'
    target.addClass 'active'
  
  filter: (e) =>
    e.preventDefault()
    # Call an application controller here