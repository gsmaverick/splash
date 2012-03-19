# View helper for a view which has it's `this.model` property set to an instance
# of **Resource**.  
Splash.Helpers.Resource =
  resourceType: ->
    @model.get('rink_type').charAt(0).toUpperCase() + @model.get('rink_type').slice(1)
    #'Not implemented'