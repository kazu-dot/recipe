class MicropostsController < ApplicationController
  before_action :correct_user,   only: :destroy

  def new
    @micropost = Micropost.new
  end

  def show
    @micropost = Micropost.find(params[:id])
    if (@micropost.published? || user_signed_in? && @micropost.draft?)
      @comments = @micropost.comments
      @comment = Comment.new
    else
      flash[:alert] = "非公開です ログインしてください"
      redirect_to root_path
    end
  end

  def index
    @tag_list = Tag.all
    @microposts = Micropost.all
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    tag_list = params[:micropost][:tag_name].split("　") unless params[:micropost][:tag_name].nil?
    if @micropost.save
      @micropost.save_tag(tag_list) unless tag_list.nil?
      flash[:success] = "投稿しました！"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      flash[:create] = 'UPDATE !'
      redirect_to micropost_path(@micropost)
    else
      render :edit
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    flash[:success] = "投稿を削除しました"
    redirect_back(fallback_location: root_path)
  end

  def search
    @microposts = Micropost.search(params[:search])
    @tag_list = Tag.all
  end

  def select
    @tag = Tag.find(params[:tag_id])
    @microposts = @tag.microposts
    @tag_list = Tag.all
  end


  private

  def micropost_params
    params.require(:micropost).permit(:title, :content, :status).merge(user_id: current_user.id)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
