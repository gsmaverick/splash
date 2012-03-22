describe "resource model", ->

  it 'should be initialized with empty attributes when none are provided', ->
    resource = new Splash.Models.Resource()
    expect(resource.name()).toBe('')
    expect(resource.lat()).toBe('0')
    expect(resource.lng()).toBe('0')
    expect(resource.type()).toBe('')
  
  it 'should be properly initialized from a JSON string', ->
    resource = new Splash.Models.Resource name: 'McMaster Pool', type: 'indoor'
    expect(resource.name()).toBe('McMaster Pool')
    expect(resource.type()).toBe('indoor')
    # Incomplete test here because we're not testing for lat/lng properties