# View responsible for rendering the About screen.
class Splash.Views.AboutView extends Backbone.Screen
  tagName: 'div'
  className: 'screen'

  _ident: 'about'
  
  render: =>
    tmpl = Handlebars.compile ($ "#about-view-template").html()
    ($ @el).html tmpl()
  
  getHeaderState: ->
    headline: 'About Splash'