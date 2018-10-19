// ページ推移した時にすでにある一つ目の入力フォーム
$(document).ready(function() {
  $('.nested-fields .time').timepicker({
    'showDuration': true,
    'timeFormat': 'H:i',
  })
  $('.nested-fields').datepair();
});

$(document).ready(function() {
  $('#schedule_plans')
    .on('cocoon:after-insert', function() {
      if($('#schedule_plans .nested-fields').length >= 15) {
        $('#add-link').hide();
      } else {
        $('#add-link').show();
      }
      $('.nested-fields .time').timepicker({
        'showDuration': true,
        'timeFormat': 'H:i',
      });
      $('.nested-fields').datepair();
    })
    .on('cocoon:after-remove', function() {
      if($('#schedule_plans .nested-fields').length = 14) {
        $('#add-link').show();
      }
    })
});
