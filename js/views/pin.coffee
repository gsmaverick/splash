class Splash.Views.PinView extends Backbone.View
  images: ['wading', 'beach', 'outdoor', 'indoor', 'splash']

  # Returns a relative path to the image to use for this pin
  markerImage: =>
    if @model.type() in @images
      imageURL  = '/images/' + @model.type() + '.png'
      shadowURL = '/images/shadow.png'

      top = new google.maps.Point(0, 0)

      @markerIcon = new google.maps.MarkerImage imageURL, new google.maps.Size(32, 37), top, new google.maps.Point(0, 37)
      @markerShadow = new google.maps.MarkerImage shadowURL, new google.maps.Size(51, 37), top, new google.maps.Point(6, 38)
  
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
    @