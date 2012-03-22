(function() {

  describe("resource model", function() {
    it('should be initialized with empty attributes when none are provided', function() {
      var resource;
      resource = new Splash.Models.Resource();
      expect(resource.name()).toBe('');
      expect(resource.lat()).toBe('0');
      expect(resource.lng()).toBe('0');
      return expect(resource.type()).toBe('');
    });
    return it('should be properly initialized from a JSON string', function() {
      var resource;
      resource = new Splash.Models.Resource({
        name: 'McMaster Pool',
        type: 'indoor'
      });
      expect(resource.name()).toBe('McMaster Pool');
      return expect(facility.type()).toBe('indoor');
    });
  });

}).call(this);
