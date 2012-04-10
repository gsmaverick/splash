# **Splash** is a cross-platform application for finding water spots.  It is 
# a descendant of [Dowsing](https://github.com/gsmaverick/Dowsing) and 
# [SkateHamilton](https://github.com/gsmaverick/skatehamilton).  All .coffee
# files in Splash are documented in [Docco](http://jashkenas.github.com/docco/)
# format.

# Main application container/namespace.  No functions or properties should be 
# defined directly on this variable.
window.Splash = 
  Views: {}
  Models: {}
  Collections: {}
  Routers: {}
  
  # This is a namespace for functions that are needed to execute various tasks
  # that don't fall strictly inside the scope of a Backbone primitive
  Controllers: {}

  # This is a namespace for any view helpers needed.  A helper should be an 
  # object where each property is a function call.
  Helpers: {}

  # Event bus for different parts of the application to communicate without
  # needing to know specific implementation details
  Vent: _.extend {}, Backbone.Events
  
  # Any initialized store of data be it a collection or model is stored in here
  # to prevent duplication of data.
  Data: {}
  
  # Application wide instance of the Google Geocoder
  Geocoder: new google.maps.Geocoder()

  Config:
    center: new google.maps.LatLng(43.24895389686911, -79.86236572265625)
    
    # These two LatLng values are used to bias the results when geocoding user
    # search input
    northeast: new google.maps.LatLng(43.44232562133663, -79.44969177246094)
    southwest: new google.maps.LatLng(43.08782090353749, -80.23246765136719) 