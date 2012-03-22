(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  Splash.Models.Resource = (function(_super) {

    __extends(Resource, _super);

    function Resource() {
      Resource.__super__.constructor.apply(this, arguments);
    }

    Resource.prototype.defaults = {
      'name': '',
      'lat': '0',
      'lng': '0',
      'rink_type': ''
    };

    Resource.prototype.initialize = function() {};

    Resource.prototype.facility = function() {
      return Splash.Data.Facilities.get(this.get('facility_id'));
    };

    Resource.prototype.name = function() {
      return this.get('name');
    };

    Resource.prototype.lat = function() {
      return this.get('lat');
    };

    Resource.prototype.lng = function() {
      return this.get('lng');
    };

    Resource.prototype.activities = function() {
      return Splash.Data.Activities.forResource(this.get('id'));
    };

    Resource.prototype.type = function() {
      return this.get('rink_type');
    };

    return Resource;

  })(Backbone.Model);

  Splash.Collections.Resources = (function(_super) {

    __extends(Resources, _super);

    function Resources() {
      Resources.__super__.constructor.apply(this, arguments);
    }

    Resources.prototype.model = Splash.Models.Resource;

    Resources.prototype.forFacility = function(facility_id) {
      return this.filter(function(resource) {
        return resource.get('facility_id') === facility_id;
      });
    };

    return Resources;

  })(Backbone.Collection);

}).call(this);
