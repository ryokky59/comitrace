class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(schedule_id: params[:schedule_id])
    redirect_to schedules_url
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to schedules_url
  end
end
