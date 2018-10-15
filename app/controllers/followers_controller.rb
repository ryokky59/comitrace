class FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = @user.followers.page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
