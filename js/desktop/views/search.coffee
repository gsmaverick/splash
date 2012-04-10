class Splash.Views.SearchView extends Backbone.View
  el: '#header'

  events:
    'click a': 'advanced'
    'submit #search_form': 'search'
  
  initialize: ->
    @bounds = new google.maps.LatLngBounds(Splash.Config.southwest, Splash.Config.northeast)
  
  # Toggles the state of the advanced search overlay with a sliding motion
  advanced: (e) =>
    e.preventDefault()
    $('#advanced').slideToggle('fast')

  # Handles a form submission
  search: (e) =>
    e.preventDefault()

    # Create the properties hash for the geocoder.  It will only search within
    # Canada and will bias results to those closest to the position defined by
    # the `location` parameter.
    props =
      address: @$('#query').val()
      bounds: @bounds

    Splash.Geocoder.geocode props, @updateMap
  
  # Handles the result of a geocoding request.  
  updateMap: (results, status) =>
    switch status
      when google.maps.GeocoderStatus.OK
        # This is a temporary hack until the proper application framework is
        # setup
        Splash.view.updateCenter results[0].geometry.location
        @$('#query').val('');
      when google.maps.GeocoderStatus.ZERO_RESULTS
        alert 'Could not find: ' + @$('#query').val() + '.  Please try another address.'
      when google.maps.UNKNOWN_ERROR
        alert 'Please try again.'
      else
        alert 'Could not complete the request.  Please try again.'