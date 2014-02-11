$ -> 
	calendar = new Calendar 'test', 'fest'
	submitButton = $ '#submit'
	submitButton.click -> 
		calendar.add  $('#todotext').val(), parseInt($('#minutes').val()), ->
			alert = $ '.alert-success'
			alert.show()
			setTimeout -> 
				alert.hide()
			,4000

	$('#todotext').focus()

	$('.alert .close').click ->
		$(this).parent().hide()



	



	
