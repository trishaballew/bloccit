class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to [@topic, @post], notice: "Comment created successfully"
    else
      redirect_to [@topic, @post], notice: "Whoops something went wrong with the save"
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end