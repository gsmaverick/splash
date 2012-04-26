class Splash.Views.Index extends Backbone.Screen
  id: 'index'
  className: 'screen'

  _ident: 'index'

  events:
    'click li': 'click'
  
  render: ->
    tmpl = Handlebars.compile ($ "#index-view-template").html()
    ($ @el).html tmpl()
  
  click: (e) ->
    id = ($ e.currentTarget).attr 'id'
    fragment = (id.split '-')[1]
    Splash.Data.Router.navigate fragment, {trigger: true}
  
  getHeaderState: ->
    headline: 'Splash'