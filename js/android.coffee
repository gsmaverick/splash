$ ->
  console.log "OK"

  # Android doesn't properly handle :active psuedo classes so we have to hack it
  # together ourselves.  This will add a class name to the element and when it's
  # touched and then remove it when the touch stops.
  # Reference: http://pervasivecode.blogspot.ca/2011/11/android-phonegap-active-css-pseudo.html
  if $.os.android
    ($ ".headline").bind "touchstart", ->
      ($ this).addClass "fake-active"
    
    ($ ".headline").bind "touchend", ->
      ($ this).removeClass "fake-active"
    
    # Sometimes a touchcancel event is fired rather than a touchend event.
    ($ ".headline").bind "touchcancel", ->
      ($ this).removeClass "fake-active"