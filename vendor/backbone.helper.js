Backbone.View = Backbone.View.extend({
  initialize: function() {
  	Backbone.View.prototype.initialize.apply(this, arguments);
  	this.extend(this.helper || {});
  }
});