class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/topics/#{comment.topic.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :price).merge(user_id: current_user.id, topic_id: params[:topic_id])
  end
end
