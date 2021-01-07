class FavoritesController < ApplicationController
before_action :set_micropost
before_action :logged_in_user

  def create
    @favorite = Favorite.create(user_id: current_user.id, micropost_id: @micropost.id)
  end

   def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, micropost_id: @micropost.id)
    @favorite.destroy
  end



  private

  def set_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end
end

