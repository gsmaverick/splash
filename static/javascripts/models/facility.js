(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  Splash.Models.Facility = (function(_super) {

    __extends(Facility, _super);

    function Facility() {
      Facility.__super__.constructor.apply(this, arguments);
    }

    Facility.prototype.defaults = {
      'name': '',
      'address': '',
      'city': '',
      'phone': '',
      'email': ''
    };

    Facility.prototype.initialize = function() {};

    Facility.prototype.name = function() {
      return this.get('name');
    };

    Facility.prototype.address = function() {
      return this.get('address');
    };

    Facility.prototype.city = function() {
      return this.get('city');
    };

    Facility.prototype.phone = function() {
      return this.get('phone');
    };

    Facility.prototype.email = function() {
      return this.get('email');
    };

    Facility.prototype.resources = function() {
      return Splash.Data.Resourcees.forFacility(this.get('id'));
    };

    return Facility;

  })(Backbone.Model);

  Splash.Collections.Facilities = (function(_super) {

    __extends(Facilities, _super);

    function Facilities() {
      Facilities.__super__.constructor.apply(this, arguments);
    }

    Facilities.prototype.model = Splash.Models.Facility;

    return Facilities;

  })(Backbone.Collection);

}).call(this);
