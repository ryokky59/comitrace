$(document).ready(function() {
  $('#schedule_plans')
    .on('cocoon:before-insert', function() {
    if($('#schedule_plans .nested-fields').length >= 14) {
          $('#add-link').hide();
    } else {
          $('#add-link').show();
    }
  })
});
