class Splash.Views.MapView extends Backbone.View
  id: 'map'
  tagName: 'div'

  # Map marker than shows the current center location of the map
  locationMarker: null

  # All the pins currently on the map
  pins: []

  # All models that should be displayed on the map
  models: []

  # Options used to configure the map with the properties available in  
  # [google.maps.MapOptions](https://developers.google.com/maps/documentation/javascript/reference#MapOptions)
  mapOpts:
    center: new google.maps.LatLng(43.24895389686911, -79.86236572265625)
    zoom: 14
    mapTypeId: google.maps.MapTypeId.ROADMAP
    streetViewControl: !1
  
  # Determine which pins should be displayed on the map
  changed: =>
    bounds = @getMapBounds()

    _.each @pins, (pin) =>
      if bounds.contains pin.marker.position
        if not pin.marker.map
          pin.setMap @map
      else
        pin.setMap null

    if @idle
      google.maps.event.removeListener @idle
  
  # Returns the bounding rectangle of the map
  getMapBounds: =>
    b = @map.getBounds()
    c = b.getNorthEast()
    d = b.getSouthWest()

    new google.maps.LatLngBounds(d, c)
  
  # Initialize all the pins for this map once the map has loaded.  Register
  # event handlers to detect bounds changes on map which are triggered by scroll
  # or zoom actions.
  loaded: =>
    _.each @models, (resource) =>
      @pins.push(new Splash.Views.PinView({ model: resource }))
    
    google.maps.event.addListener @map, 'dragend', @waitForIdle
    google.maps.event.addListener @map, 'zoom_changed', @waitForIdle

    # Don't need to listen for the load event anymore
    google.maps.event.removeListener @loadEv

    # Determine which pins to show on initial load
    @changed()
  
  # Trigger an event on the google map
  trigger: (ev) =>
    google.maps.event.trigger(@map, ev)
  
  updateCenter: (center) =>
    if @locationMarker
      @locationMarker.setMap null
    
    @locationMarker = new google.maps.Marker
      position: center
      map: @map
      title: 'Current Location'
    
    @map.setZoom 14
    @map.setCenter center
  
  # After the map's bounds have been changed; wait for all events to finish 
  # firing before we update the pins on the map.
  waitForIdle: =>
    @idle = google.maps.event.addListener @map, 'idle', @changed
    
  # Renders the map into the *currently* phantom DOM object and then setups a
  # callback to do the rest of the "rendering" once the map has fully loaded.
  render: =>
    @map = new google.maps.Map @el, @mapOpts
    @loadEv = google.maps.event.addListener @map, 'tilesloaded', @loaded
    @