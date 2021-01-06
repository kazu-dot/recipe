class PublicController < ApplicationController
  def home
    @user = current_user
    @microposts = Micropost.all.order(updated_at: :desc).limit(10)
  end
end
