# Backbone Model representation of the **Resource** module as defined in the
# [GRAF specification](https://github.com/gsmaverick/graf-spec).  This model is
# written to be self documenting and calling @get directly on a model instance
# should be avoided.
class Splash.Models.Resource extends Backbone.Model
  defaults:
    'name': ''
    'lat': '0'
    'lng': '0'
    'rink_type': ''

  initialize: ->

  # Returns the **Facility** this **Resource** belongs to 
  facility: ->
    Splash.Data.Facilities.get (@get 'facility_id')
  
  name: ->
    @get 'name'
  
  lat: ->
    @get 'lat'
  
  lng: ->
    @get 'lng'
  
  # Returns the activities offered at this **Resource**
  activities: ->
    Splash.Data.Activities.forResource @get 'id'
  
  # Returns a properly capitalized version of the type
  type: ->
    (@get 'rink_type')

class Splash.Collections.Resources extends Backbone.Collection
  model: Splash.Models.Resource

  # Return any **Resource** located at `facility_id` 
  forFacility: (facility_id) ->
  	@filter (resource) -> resource.get('facility_id') == facility_id