class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.micropost_id = params[:micropost_id]
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'コメント投稿に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @micropost = Micropost.find(params[:micropost_id])
    @comments = @micropost.comments.all
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end

