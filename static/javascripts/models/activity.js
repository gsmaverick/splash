(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  Splash.Models.Activity = (function(_super) {

    __extends(Activity, _super);

    function Activity() {
      Activity.__super__.constructor.apply(this, arguments);
    }

    Activity.prototype.initialize = function() {};

    Activity.prototype.name = function() {
      return this.get('name');
    };

    Activity.prototype.resource = function() {
      return Splash.Data.Resources.get(this.get('resource_id'));
    };

    Activity.prototype.fee_class = function() {
      return this.get('fee_class');
    };

    Activity.prototype.times = function() {
      return Splash.Data.ActivityTimes.forActivity(this.get('id'));
    };

    return Activity;

  })(Backbone.Model);

  Splash.Collections.Activities = (function(_super) {

    __extends(Activities, _super);

    function Activities() {
      Activities.__super__.constructor.apply(this, arguments);
    }

    Activities.prototype.model = Splash.Models.Activity;

    Activities.prototype.forResource = function(resource_id) {
      return this.filter(function(activity) {
        return activity.get('resource_id') === resource_id;
      });
    };

    return Activities;

  })(Backbone.Collection);

}).call(this);
