class Splash.Views.AdvancedSearchView extends Backbone.View
  el: '#advanced'

  events:
    'click .item': 'change'
    'click .filter': 'filter'
    'click .cancel': 'cancel'
  
  # Closes the search view and clears out any filtering that was applied to the
  # mapped results.  It then updates the collection being rendered onto the map.
  cancel: (e) =>
    e.preventDefault()

    # Reset the radio buttons
    $('.types').each (i, el) ->
      $els = $(el).children()
      $els.removeClass 'active'
      $els.first().addClass 'active'
    
    # Reset the range slider
    # Update the map view    
    # Close the search view
    @$el.slideUp('fast')
  
  # Radio button like functionality for the mutual exclusivity selectors
  change: (e) =>
    $target = $(e.target)
    $target.siblings().removeClass 'active'
    $target.addClass 'active'
  
  filter: (e) =>
    e.preventDefault()
    # Call an application controller here