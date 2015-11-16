$(document).ready(function() {
  $("#exercise_workout_date").datepicker({ dateFormat: 'yy-mm-dd'});

  line_data = $('#chart').data('workouts');
  snatch = [];
  c_j = [];

  line_data.forEach(function(lift) {
    if (lift.name == "Snatch") {
      snatch.push(lift);
    } else {
      c_j.push(lift);
    }
  });

  new Morris.Line({
    element: 'chart', 
    data: snatch,
    labels: ['Snatch'],
    xkey: 'workout_date',
    ykeys: ['work_sets'],
    xLabels: 'day',
    xLabelAngle: 60,
    xLabelFormat: function (x) {
      date_string = x.getFullYear() + "/" + parseInt(x.getMonth() + 1) + "/" + x.getDate();
      return date_string;
    },
    yLabelFormat: function(x) {
      return x + ' kg';
    }
  });
});