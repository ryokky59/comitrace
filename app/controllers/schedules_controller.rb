class SchedulesController < ApplicationController
  before_action :set_current_user_schedule, only: [:edit, :update, :destroy]

  def top; end

  def index
    @schedules = Schedule.select(:id, :title, :content, :user_id).includes(:user).recent.page(params[:page]).per(6)

    respond_to do |format|
      format.html
      format.js
    end
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
    @schedule = current_user.schedules.new(schedule_params)

    if @schedule.valid?
      gon.data, gon.labels = @schedule.time_calc
    else
      render 'new'
    end
  end

  def create
    @schedule = current_user.schedules.new(schedule_params)

    if @schedule.save
      redirect_to schedule_path(id: @schedule.id), notice: "スケジュールを投稿しました"
    else
      render 'new'
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
    gon.data, gon.labels = @schedule.time_calc
    @favorite = current_user.favorites.find_by(schedule_id: @schedule.id)
    @comments = @schedule.comments.page(params[:page]).per(5)
    @comment = @schedule.comments.build

    respond_to do |format|
      format.html
      format.js { render 'comments/index' }
    end
  end

  def edit
    redirect_to schedules_path unless @schedule.user_id == current_user.id
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedule_path(id: @schedule.id), notice: "スケジュールを編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path, notice: "スケジュールを削除しました"
  end

  private
  def schedule_params
    params.require(:schedule).permit(:title, :content, schedule_plans_attributes: [:id, :schedule_id, :plan, :start_time, :end_time, :_destroy])
  end

  def set_current_user_schedule
    @schedule = current_user.schedules.find(params[:id])
  end
end
