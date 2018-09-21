class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites.create(schedule_id: params[:schedule_id])
    @schedule = Schedule.find(params[:schedule_id])
    respond_to do |format|
      if @favorite.save
        format.js
      else
        format.html { redirect_to schedule_path(@schedule) }
      end
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])
    @schedule = favorite.schedule
    respond_to do |format|
      if favorite.destroy
        format.js
      else
        format.html { redirect_to schedule_path(@schedule) }
      end
    end
  end
end
