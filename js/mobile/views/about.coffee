# View responsible for rendering the About screen.
class Splash.Views.AboutView extends Backbone.Screen
  tagName: 'div'
  className: 'screen'

  _ident: 'about'
  _header: ['About Splash']
  
  render: =>
    tmpl = Handlebars.compile ($ "#about-view-template").html()
    ($ @el).html tmpl()