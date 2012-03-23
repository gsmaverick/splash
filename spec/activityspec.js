describe('activity model', function() {
  it('should be initialized with empty attributes when none are provided', function() {
    var activity = new Splash.Models.Activity();
    expect(activity.name()).toBe('');
    expect(activity.fee_class()).toBe('');
  });

  it('should be properly initialized from a JSON string', function() {
    var activity = new Splash.Models.Activity({
        name: 'Public Swim',
        fee_class: '1'
    });
    expect(activity.name()).toBe('Public Swim');
    expect(activity.fee_class()).toBe('1');
  });
});