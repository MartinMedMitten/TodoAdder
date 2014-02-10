test 'hello world', -> 
	ok 1 == 1

test 'calendar_can_be_initialized',  ->
	calendar = new Calendar('martinmedmitten', 'password')
	ok true, "did not crash"

#test 'calendar_add_minutes_to_now_works', ->
	#calendar = new Calendar('martinmedmitten', 'password')
	#now = new Date()


asyncTest 'authorize_works', ->
	checkAuth (authResult) ->
		ok(!authResult.error) 
		start()


test 'calendar_add_makes', =>
	calendar = new Calendar('martinmedmitten', 'password')
	
	#$.ajax = (options) ->
    #    equal options.url, "path"
    #    equal options.data.text, "message"
    #    options.success "Hello"; #denna anropar alltså sucesscallbacken på de ja mockar
    
	minutes = 60
	calendar.add('message', minutes)