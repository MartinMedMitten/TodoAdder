$ -> 
	calendar = new Calendar 'test', 'fest'
	submitButton = $ '#submit'
	submitButton.click -> 
		calendar.addTwo  $('#todotext').val(), parseInt($('#minutes').val())

	$('#todotext').focus()
	
