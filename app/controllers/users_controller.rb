class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    if @user.schedule_id.present?
      @schedule = Schedule.find(@user.schedule_id)
      gon.data = []
      gon.labels = []

      @schedule.schedule_plans.each do |schedule_plan|

        if schedule_plan.start_time > schedule_plan.end_time
          gon.data << 24 * 60 * 60 - (schedule_plan.start_time.to_i - schedule_plan.end_time.to_i)
        else
          gon.data << (schedule_plan.end_time.to_i - schedule_plan.start_time.to_i)
        end
        gon.labels << schedule_plan.plan
      end
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  def favorite_stocks
    @user = User.find(params[:id])
    @schedules = @user.favorite_schedules.order(created_at: :desc).page(params[:page]).per(6)
  end

  def create_stocks
    @user  = User.find(params[:id])
    @schedules = @user.schedules.order(created_at: :desc).page(params[:page]).per(6)
  end

  def schedule_trace
    @user  = current_user
    @schedule = Schedule.find(params[:id])
    if @user.update(schedule_id: @schedule.id)
      redirect_to user_path(id: @user.id)
    end
  end


end
