class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    if @user.schedule_id.present?
    @schedule = Schedule.find(@user.schedule_id)
    gon.data = []
    gon.labels = []
    gon.bgcolor = []
    color = ["#FF0000", "#FE9A2E", "#F7FE2E", "#0040FF", "#00FF40", "#DF01D7", "#00FFFF", "#8000FF", "#BFFF00", "#045FB4"]

    @schedule.schedule_plans.each do |schedule_plan|

      if schedule_plan.start_time > schedule_plan.end_time
        gon.data << 24 * 60 * 60 - (schedule_plan.start_time.to_i - schedule_plan.end_time.to_i)
      else
        gon.data << (schedule_plan.end_time.to_i - schedule_plan.start_time.to_i)
      end
      gon.labels << schedule_plan.plan
      gon.bgcolor << color.sample
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

  def schedule_choise
    @user  = current_user
    @schedule = Schedule.find(params[:id])
    if @user.update(schedule_id: @schedule.id)
      redirect_to user_path(id: @user.id)
    end
  end


end
