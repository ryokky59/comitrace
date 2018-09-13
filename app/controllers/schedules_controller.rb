class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:edit, :update, :delete, :show]

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
      redirect_to schedule_path(id: @schedule.id)
    else
      render 'new'
    end
  end

#  def confirm
#    @schedule = Schedule.new(schedule_params)
#    @schedule.user_id = current_user.id
#    render 'new' if @schedule.invalid?
#  end

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
    params.require(:schedule).permit(:title, :content, schedule_plans_attributes: [:id,:plan, :start_time, :end_time])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end



end
