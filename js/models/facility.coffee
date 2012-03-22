# Backbone Model representation of the **Facility** module as defined in the
# [GRAF specification](https://github.com/gsmaverick/graf-spec).  This model is
# written to be self documenting and calling @get directly on a model instance
# should be avoided.
class Splash.Models.Facility extends Backbone.Model
  defaults:
    'name': ''
    'address': ''
    'city': ''
    'phone': ''
    'email': ''
  
  initialize: ->
  
  name: ->
    @get 'name'
  
  address: ->
    @get 'address'
  
  city: ->
    @get 'city'
  
  phone: ->
    @get 'phone'
  
  email: ->
    @get 'email'
  
  # Returns the resources located at this **Facility**
  resources: ->
    Splash.Data.Resourcees.forFacility @get 'id'

class Splash.Collections.Facilities extends Backbone.Collection
  model: Splash.Models.Facility