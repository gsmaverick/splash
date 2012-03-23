# Backbone Model representation of the **Activity** module as defined in the
# [GRAF specification](https://github.com/gsmaverick/graf-spec).  This model is
# written to be self documenting and calling @get directly on a model instance
# should be avoided.
class Splash.Models.Activity extends Backbone.Model
  defaults:
    'name': ''
    'fee_class': ''
    
  initialize: ->

  name: ->
    @get 'name'
  
  # Returns the **Resource** this **Activity** belongs to 
  resource: ->
    Splash.Data.Resources.get (@get 'resource_id')
  
  # Returns a reference to the **Fee Class** that applies to this **Activity**
  # This is not currently supported
  fee_class: ->
    @get 'fee_class'
  
  # Returns an array of **ActivityTime** models which contain the times when 
  # this **Activity** is offered
  times: ->
    Splash.Data.ActivityTimes.forActivity @get 'id'


class Splash.Collections.Activities extends Backbone.Collection
  model: Splash.Models.Activity

  # Return any **Activity** offered at `resource_id` 
  forResource: (resource_id) ->
  	@filter (activity) -> activity.get('resource_id') == resource_id