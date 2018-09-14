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
      redirect_to confirm_schedules_path
    else
      render 'new'
    end
  end

  def confirm
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id

    color = ["#b2b21f", "#3ff353", "#4d8964","#540a32"]

    gon.data = []
    gon.labels = []
    gon.bgcolor = []
    @schedule.schedule_plans.each do |s|
      gon.labels << s.plan
      if s.start_time > s.end_time
        gon.data << 24 * 60 * 60 - (s.start_time.to_i - s.end_time.to_i)
      else
        gon.data << (s.end_time.to_i - s.start_time.to_i)
      end
      gon.bgcolor << color.sample
    end


#    gon.data = []
#    @schedule.schedule_plans.size.times do
#      gon.data << rand(100.0)
#    end
    render 'new' if @schedule.invalid?
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
    params.require(:schedule).permit(:title, :content, schedule_plans_attributes: [:id,:plan, :start_time, :end_time])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end



end
