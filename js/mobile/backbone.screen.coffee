# Since every view transition in Splash is done with a sliding motion we want to
# define a new type Backbone.Screen that inherits from Backbone.View but has the
# necessary sliding mechanisms built in.
class Backbone.Screen extends Backbone.View
  # Brings a view onto the screen by putting its el into the passed selector and
  # then animating it onto the screen with the given `dir`.  This can be either
  # `rtl` or `ltr`.  After it's on the screen a little clean-up is performed.
  construct: (_el, dir) =>
    cls = 'new-' + dir
    ($ @el).addClass 'animatable ' + cls
    _el.append @el

    # This is a little hack to delay the removing of the class.  If it was
    # removed straight out then the animation doesn't show up and the view just
    # appears in its final position unanimated.  By delaying the removal of the
    # class a millisecond we get the desired effect of the view animating onto 
    # the screen with a sliding motion.
    setTimeout @finish, 1, cls
  
  finish: (cls) =>
    ($ @el).removeClass cls
    ($ @el).addClass 'finish' # Fixes a bug with absolute positioned elements

  # Destroys this view by sliding it off the screen in the direction passed in 
  # `dir`.  This can be either `rtl` or `ltr`.  After the animation is finished
  # the view is unbound and removed from the DOM.
  destruct: (dir) =>
    ($ @el).on 'webkitTransitionEnd', =>
      @unbind()
      @remove()
    
    # Now add the required transformation via a CSS class to this view
    ($ @el).addClass 'old-' + dir