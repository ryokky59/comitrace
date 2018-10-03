class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:edit, :update, :destroy, :show]

  def top; end

  def index
    @schedules = Schedule.order(created_at: :desc).page(params[:page]).per(6)
  end

  def new
    if params[:back]
      @schedule = Schedule.new(schedule_params)
    else
      @schedule = Schedule.new
      @schedule.schedule_plans.build
    end
  end

  def confirm
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    @user = User.find_by(id: @schedule.user_id)

    gon.data, gon.labels = @schedule.time_calc

    render 'new' if @schedule.invalid?
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

  def edit
    @schedule.user_id = current_user.id
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedule_path(id: @schedule.id)
    else
      render 'edit'
    end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path
  end

  def show
    @user = User.find_by(id: @schedule.user_id)

    gon.data, gon.labels = @schedule.time_calc

    @favorite = current_user.favorites.find_by(schedule_id: @schedule.id)

    @comments = @schedule.comments.order(created_at: :desc).page(params[:page]).per(5)
    @comment = @schedule.comments.build

    respond_to do |format|
      format.js { render 'comments/index' }
      format.html
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:title, :content, schedule_plans_attributes: [:id, :schedule_id, :plan, :start_time, :end_time, :_destroy])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
