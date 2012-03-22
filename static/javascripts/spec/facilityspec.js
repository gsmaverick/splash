(function() {

  describe("facility model", function() {
    it('should be initialized with empty attributes when none are provided', function() {
      var facility;
      facility = new Splash.Models.Facility();
      expect(facility.name()).toBe('');
      expect(facility.address()).toBe('');
      expect(facility.city()).toBe('');
      expect(facility.phone()).toBe('');
      return expect(facility.email()).toBe('');
    });
    return it('should be properly initialized from a JSON string', function() {
      var facility;
      facility = new Splash.Models.Facility({
        name: 'McMaster',
        address: '1280 Main St.',
        city: 'Hamilton',
        phone: '9056485018',
        email: 'contact@mcmaster.ca'
      });
      expect(facility.name()).toBe('McMaster');
      expect(facility.address()).toBe('1280 Main St.');
      expect(facility.city()).toBe('Hamilton');
      expect(facility.phone()).toBe('9056485018');
      return expect(facility.email()).toBe('contact@mcmaster.ca');
    });
  });

}).call(this);
