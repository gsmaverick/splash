# **Splash** is a cross-platform application for finding water spots.  It is 
# a descendant of [Dowsing](https://github.com/gsmaverick/Dowsing) and 
# [SkateHamilton](https://github.com/gsmaverick/skatehamilton).  All .coffee
# files in Splash are documented in [Docco](http://jashkenas.github.com/docco/)
# format.

# Main application container/namespace.  No functions or properties should be 
# defined directly on this variable.
Splash = 
  Views: {}
  Models: {}
  Collections: {}
  Routers: {}
  
  # This is a namespace for functions that are needed to execute various tasks
  # that don't fall strictly inside the scope of a Backbone primitive
  Controllers: {}

  # Event bus for different parts of the application to communicate without
  # needing to know specific implementation details
  Vent: _.extend {}, Backbone.Events
  
  # Any initialized store of data be it a collection or model is stored in here
  # to prevent duplication of data.
  Data: {}