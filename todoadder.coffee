whenDateLabel = $ '#whendatelabel'
whenTimeLabel = $ '#whentimelabel'
whenDayLabel = $ '#whendaylabel'
unitLabel = $ '#unitlabel'


$ -> 
	calendar = new Calendar 'test', 'fest'
	submitButton = $ '#submit'
	minuteTextBox = $ '#minutes'

	updateWhenLabel()

	minuteTextBox.keyup ->
		updateWhenLabel()
	
	#jag borde räkna ut någonstans när det kommer att bli

	#METODO här kan jag göra en funktion

	unitLabel.click ->
		if selectedUnitIsHours()
			unitLabel.text('Minutes')
		else
			unitLabel.text('Hours')

	submitButton.click -> 
		minutes = getMinutes()
		calendar.add  $('#todotext').val(), minutes, ->
			alert = $ '.alert-success'
			alert.show()
			setTimeout -> 
				alert.hide()
			,4000

	$('#todotext').focus()

	$('.alert .close').click ->
		$(this).parent().hide()



updateWhenLabel = ->
	start = new Date()
	start.setMinutes start.getMinutes() + getMinutes()  #Ugly, but fits my timezone
	whenDayLabel.text(getWeekDayName(start));
	split = start.toLocaleString('sv-SE').split ' '
	whenDateLabel.text(split[0])
	whenTimeLabel.text(split[1])

getMinutes = ->
	minutes = parseInt($('#minutes').val())
	minutes = minutes * 60 if selectedUnitIsHours()
	minutes


selectedUnitIsHours = ->
	unitLabel.text() == 'Hours'

getWeekDayName = (date) ->
	weekday = ['Söndag', 'Måndag', 'Tisdag', 'Onsdag','Torsdag', 'Fredag', 'Lördag']
	weekday[date.getDay()]

	
