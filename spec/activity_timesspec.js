describe('activity times model', function() {
  it('should be initialized with default attributes when none are provided', function() {
    var activity_time = new Splash.Models.ActivityTime();
    expect(activity_time.start_time()).toBe('0:00');
    expect(activity_time.end_time()).toBe('0:00');
    expect(activity_time.start_date()).toBe('');
    expect(activity_time.end_date()).toBe('');
    expect(activity_time.days()).toBe('0000000');
  });

  it('should be properly initialized from a JSON string', function() {
    var activity_time = new Splash.Models.ActivityTime({
        start_time: '15:00',
        end_time: '17:00',
        days: '0001000'
    });
    expect(activity_time.start_time()).toBe('15:00');
    expect(activity_time.end_time()).toBe('17:00');
    // Incomplete testing here since we're not yet testing 
    // [start, end]_date attributes
    expect(activity_time.start_date()).toBe('');
    expect(activity_time.end_date()).toBe('');
    expect(activity_time.days()).toBe('0001000');
  });
});