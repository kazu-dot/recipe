class MicropostsController < ApplicationController
  before_action :set_user

  def new
    @micropost = Micropost.new
  end

  def show

  end

  private

  def micropost_parameter
    params.require(:micropost).permit(:title, :content).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
