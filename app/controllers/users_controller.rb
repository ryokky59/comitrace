class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    if @user.schedule_id.present?
      @schedule = Schedule.find(@user.schedule_id)
      gon.data, gon.labels = @schedule.time_calc
    end
  end

  def schedule_trace
    @user  = current_user
    @schedule = Schedule.find(params[:id])

    if @user.update(schedule_id: @schedule.id)
      redirect_to user_path(id: @user.id), notice: "スケジュールをTraceしました。"
    end
  end
end
