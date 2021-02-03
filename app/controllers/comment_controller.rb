class CommentController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "コメントしました！"
      redirect_to @comment.micropost
      #コメントした投稿のshowページにリダイレクトする
    else
      flash[:alert] = 'コメントに失敗しました'
      render :new
      #コメントフォームを描写する
    end
  end

  def destroy
    comment = micropost.find(params[:id])
    current_micropost.unfollow(micropost)
    redirect_to micropost
  end
end
