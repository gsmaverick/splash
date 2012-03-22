(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  Splash.Models.ActivityTime = (function(_super) {

    __extends(ActivityTime, _super);

    function ActivityTime() {
      ActivityTime.__super__.constructor.apply(this, arguments);
    }

    ActivityTime.prototype.initialize = function() {};

    ActivityTime.prototype.activity = function() {
      return Splash.Data.Activities.get(this.get('activity_id'));
    };

    ActivityTime.prototype.start_time = function() {
      return this.get('start_time');
    };

    ActivityTime.prototype.end_time = function() {
      return this.get('end_time');
    };

    ActivityTime.prototype.start_date = function() {
      return this.get('start_date');
    };

    ActivityTime.prototype.end_date = function() {
      return this.get('end_date');
    };

    return ActivityTime;

  })(Backbone.Model);

  Splash.Collections.ActivityTimes = (function(_super) {

    __extends(ActivityTimes, _super);

    function ActivityTimes() {
      ActivityTimes.__super__.constructor.apply(this, arguments);
    }

    ActivityTimes.prototype.model = Splash.Models.ActivityTime;

    ActivityTimes.prototype.forActivity = function(activity_id) {
      return this.filter(function(time) {
        return time.get('activity_id') === activity_id;
      });
    };

    return ActivityTimes;

  })(Backbone.Collection);

}).call(this);
