class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    if @user.schedule_id.present?
      @schedule = Schedule.find(@user.schedule_id)
      gon.data, gon.labels = @schedule.time_calc
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following.order(created_at: :desc).page(params[:page]).per(10)

    respond_to do |format|
      format.js { render :following }
    end
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.order(created_at: :desc).page(params[:page]).per(10)

    respond_to do |format|
      format.js { render :followers }
    end
  end

  def create_stocks
    @user  = User.find(params[:id])
    @schedules = @user.schedules.order(created_at: :desc).page(params[:page]).per(6)

    respond_to do |format|
      format.js { render :create_stocks }
    end
  end

  def favorite_stocks
    @user = User.find(params[:id])
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


end
