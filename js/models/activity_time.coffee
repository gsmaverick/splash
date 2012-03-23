# Backbone Model representation of the **ActivityTime** module as defined in the
# [GRAF specification](https://github.com/gsmaverick/graf-spec).  This model is
# written to be self documenting and calling @get directly on a model instance
# should be avoided.
class Splash.Models.ActivityTime extends Backbone.Model
  defaults:
    'start_time': '0:00'
    'end_time': '0:00'
    'start_date': ''
    'end_date': ''
    'days': '0000000'

  initialize: ->
  
  # Returns the **Activity** this **ActivityTime** belongs to 
  activity: ->
    Splash.Data.Activities.get (@get 'activity_id')

  start_time: ->
    @get 'start_time'
  
  end_time: ->
    @get 'end_time'
  
  start_date: ->
    @get 'start_date'
  
  end_date: ->
    @get 'end_date'
  
  days: ->
    @get 'days'


class Splash.Collections.ActivityTimes extends Backbone.Collection
  model: Splash.Models.ActivityTime

  # Return any **ActivityTime** when `activity_id` is offered
  forActivity: (activity_id) ->
  	@filter (time) -> time.get('activity_id') == activity_id