// Generated by CoffeeScript 1.6.3
var getMinutes, getWeekDayName, selectedUnitIsHours, unitLabel, updateWhenLabel, whenDateLabel, whenDayLabel, whenTimeLabel;

whenDateLabel = $('#whendatelabel');

whenTimeLabel = $('#whentimelabel');

whenDayLabel = $('#whendaylabel');

unitLabel = $('#unitlabel');

$(function() {
  var calendar, minuteTextBox, submitButton;
  calendar = new Calendar('test', 'fest');
  submitButton = $('#submit');
  minuteTextBox = $('#minutes');
  updateWhenLabel();
  minuteTextBox.keyup(function() {
    return updateWhenLabel();
  });
  unitLabel.click(function() {
    if (selectedUnitIsHours()) {
      return unitLabel.text('Minutes');
    } else {
      return unitLabel.text('Hours');
    }
  });
  submitButton.click(function() {
    var minutes;
    minutes = getMinutes();
    return calendar.add($('#todotext').val(), minutes, function() {
      var alert;
      alert = $('.alert-success');
      alert.show();
      return setTimeout(function() {
        return alert.hide();
      }, 4000);
    });
  });
  $('#todotext').focus();
  return $('.alert .close').click(function() {
    return $(this).parent().hide();
  });
});

updateWhenLabel = function() {
  var split, start;
  start = new Date();
  start.setMinutes(start.getMinutes() + getMinutes());
  whenDayLabel.text(getWeekDayName(start));
  split = start.toLocaleString('sv-SE').split(' ');
  whenDateLabel.text(split[0]);
  return whenTimeLabel.text(split[1]);
};

getMinutes = function() {
  var minutes;
  minutes = parseInt($('#minutes').val());
  if (selectedUnitIsHours()) {
    minutes = minutes * 60;
  }
  return minutes;
};

selectedUnitIsHours = function() {
  return unitLabel.text() === 'Hours';
};

getWeekDayName = function(date) {
  var weekday;
  weekday = ['Söndag', 'Måndag', 'Tisdag', 'Onsdag', 'Torsdag', 'Fredag', 'Lördag'];
  return weekday[date.getDay()];
};
