class CommentsController < ApplicationController
  # def index
  #   @comment_topics = current_user.comment_topics
  # end
  
  def new
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
  
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      flash.now[:danger] = 'コメントに失敗しました'
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:topic_id, :comment)
  end
  
end
