class MicropostsController < ApplicationController
  before_action :set_user
  before_action :correct_user,   only: :destroy

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました！"
      redirect_to root_url
    else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:title, :content).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
