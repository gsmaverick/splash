class Splash.Views.DetailView extends Backbone.Screen
  tagName: 'div'
  className: 'screen'

  _ident: 'detail'

  template:
    base: '#detail-view-template'
  
  events:
    'click .activity': 'toggleActivity'

  initialize: ->
    @
   
  render: =>
    tmpl = Handlebars.compile ($ @template.base).html()
    res =
      name: 'Ancaster Aquatic Centre'
      address: '47 Meadowbrook Dr.'
      type: 'Indoor'
      phone: '1234567890'
      link: ''
      lat: ''
      lng: ''

    ($ @el).html tmpl res

    @
  
  getHeaderState: ->
    headline: 'Valens Conservation Area'
  
  # Open and close the activity's detail dropdown
  toggleActivity: (e) ->
    target = ($ e.currentTarget)
    target.next().toggle()
    if target.hasClass 'open'
      target.removeClass 'open'
      target.next().next().removeClass 'after'
    else
      target.addClass 'open'
      target.next().next().addClass 'after'
    
    return