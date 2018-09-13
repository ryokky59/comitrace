class SchedulesController < ApplicationController
  def top
  end

  def index
    @schedules = Schedule.all.includes(:schedule_plans)
  end

  def new
    @schedule = Schedule.new
    @schedule.schedule_plans.build
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    if @schedule.save
      redirect_to schedules_path
    else
      render 'new'
    end
  end

  def confirm
  end

  def edit
  end

  def update
  end

  def delete
  end

  def show
  end

  private
  def schedule_params
    params.require(:schedule).permit(:title, :content, schedule_plans_attributes: [:id,:plan, :start_time, :end_time, :_destroy])
  end



end
