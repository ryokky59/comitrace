module SchedulesHelper
  def choose_new_or_edit
  if action_name == 'new' || action_name == 'confirm'
    confirm_schedules_path
  elsif action_name == 'edit'
    schedule_path
  end
end
end
