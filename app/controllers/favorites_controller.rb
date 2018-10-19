class FavoritesController < ApplicationController
  respond_to? :js

  def create
    @favorite = current_user.favorites.create(schedule_id: params[:schedule_id])
    @schedule = Schedule.find(params[:schedule_id])
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]) #pertialで{favorite: @favorite}にしているのでインスタンス変数にはしない
    @schedule = favorite.schedule
    favorite.destroy
  end
end
