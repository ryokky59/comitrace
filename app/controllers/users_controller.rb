class UsersController < ApplicationController
  before_action :set_user, only: [:show, :following, :followers, :create_stocks, :favorite_stocks]

  def show
    if @user.schedule_id.present?
      @schedule = Schedule.find(@user.schedule_id)
      gon.data, gon.labels = @schedule.time_calc
    end
  end

  def following
    @users = @user.following.order(created_at: :desc).page(params[:page]).per(10)

    respond_to do |format|
      format.js { render :following }
    end
  end

  def followers
    @users = @user.followers.order(created_at: :desc).page(params[:page]).per(10)

    respond_to do |format|
      format.js { render :followers }
    end
  end

  def create_stocks
    @schedules = @user.schedules.order(created_at: :desc).page(params[:page]).per(6)

    respond_to do |format|
      format.js { render :create_stocks }
    end
  end

  def favorite_stocks
    @schedules = @user.favorite_schedules.order(created_at: :desc).page(params[:page]).per(6)

    respond_to do |format|
      format.js { render :favorite_stocks }
    end
  end

  def schedule_trace
    @user  = current_user
    @schedule = Schedule.find(params[:id])
    if @user.update(schedule_id: @schedule.id)
      redirect_to user_path(id: @user.id)
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
