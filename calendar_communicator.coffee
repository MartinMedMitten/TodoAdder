APIKEY = 'AIzaSyDf_29T5PvBnRAc3iqkzHXo_MnxwN17-GU'
scopes = ['https://www.googleapis.com/auth/calendar']
clientId = '17929449522-pgng8h8l7qp3h8adpnn5rb4il5v7nsb5.apps.googleusercontent.com'

handleClientLoad = ->
    gapi.client.setApiKey APIKEY
    window.setTimeout -> checkAuth handleAuthResult , 1

checkAuth = (onResult) ->
    gapi.auth.authorize {client_id: clientId, scope: scopes, immediate: true}, onResult

handleAuthResult = (authResult) ->
    authorizeButton = document.getElementById 'authorize-button'
    if authResult && !authResult.error
      authorizeButton.style.visibility = 'hidden'
    else 
      authorizeButton.style.visibility = ''
      authorizeButton.onclick = handleAuthClick

handleAuthClick = (event) -> 
	gapi.auth.authorize {client_id: clientId, scope: scopes, immediate: false}, handleAuthResult
	return false

class Calendar
	constructor: (@username, @password) ->

	add: (message, minutes) ->
		cal = 'cm.eriksen@gmail.com'
		path = "https://www.googleapis.com/calendar/v3/calendars/#{cal}/events?pp=1&key=#{APIKEY}"

		text = 'Brunch with Mom at Java 11am Sunday'
		message = text
		

		$.post path,
			'text' : message
			(data) -> $('body').append "Successfully posted to the page."

	addTwo: (message, minutes) ->

		start = new Date()
		start.setMinutes start.getMinutes() + minutes
		end = new Date()
		end.setMinutes end.getMinutes() + minutes


		gapi.client.load 'calendar', 'v3', ->
			resource = 
				"summary" : message
				"location" : "Somewhere"
				"start":
					"dateTime" : start.toISOString()
				"end" : 
					"dateTime": end.toISOString()


			request = gapi.client.calendar.events.insert
	  			'calendarId': 'primary'
	  			'resource': resource
				  
			request.execute (resp) ->
	  			console.log resp 
  



  

#<script>
#  function auth() {
#    var config = {
#     'client_id': 'YOUR CLIENT ID',
 #     'scope': 'https://www.googleapis.com/auth/urlshortener'
#    };
#    gapi.auth.authorize(config, function() {
#      console.log('login complete');
#      console.log(gapi.auth.getToken());
#    });
#  }
#</script>

     