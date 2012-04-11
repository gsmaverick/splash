# Handles the render and display of a Google.Maps.Marker on the map and handles
# any events associated with the pin.  It also calculates the images needed to 
# display the pin.
class Splash.Views.PinView extends Backbone.View
  images: ['wading', 'beach', 'outdoor', 'indoor', 'splash']

  # Sets the pin marker images based on the contents of the model which is 
  # attached to this pin.
  markerImage: =>
    if @model.type() in @images
      imageURL  = '/images/' + @model.type() + '.png'
      shadowURL = '/images/shadow.png'

      origin  = new google.maps.Point(0, 0)
      iSize   = new google.maps.Size(32, 37)
      iAnchor = new google.maps.Point(0, 37)
      sSize   = new google.maps.Size(51, 37)
      sAnchor = new google.maps.Point(6, 38)

      @markerIcon = new google.maps.MarkerImage imageURL, iSize, origin, iAnchor
      @markerShadow = new google.maps.MarkerImage shadowURL, sSize, origin, sAnchor
  
  # Returns an instance of a Google.Map.Marker object along with the associated
  # pin image and shadow image.
  generateMarker: =>
    @markerImage()

    opts =
      position: new google.maps.LatLng(@model.lat(), @model.lng())
      map: null
      icon: @markerIcon
      shadow: @markerShadow
      id: @model.get('id')
      title: @model.name()
    
    new google.maps.Marker(opts)

  setMap: (map) =>
    @marker.setMap map

  initialize: ->
    @render()

  render: =>
    @marker = @generateMarker()
    google.maps.event.addListener @marker, 'click', @click
    @
  
  click: =>
    # Trigger an event on the application event bus and let the listener to that
    # event take care of further action.
    Splash.Vent.trigger('pin:click', @model.get('id'))