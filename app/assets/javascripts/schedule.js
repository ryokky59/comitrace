$(document).ready(function() {
  $('.nested-fields .time').timepicker({
    'showDuration': true,
    'timeFormat': 'H:i',
    'forceRoundTime': true
  })
  $('.nested-fields').datepair();
});

$(document).ready(function() {
  $('#schedule_plans')
    .on('cocoon:before-insert', function() {
      if($('#schedule_plans .nested-fields').length >= 14) {
        $('#add-link').hide();
      } else {
        $('#add-link').show();
      }
    })
    .on('cocoon:after-insert', function() {
      $('.nested-fields .time').timepicker({
        'showDuration': true,
        'timeFormat': 'H:i',
        'forceRoundTime': true
      });
      $('.nested-fields').datepair();
    })
    .on('cocoon:after-remove', function() {
      if($('#schedule_plans .nested-fields').length = 14) {
        $('#add-link').show();
      }
    })
});
