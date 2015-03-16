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

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    
    authorize @comment
    if @comment.destroy
      flash[:notice] =  "Comment was removed."
      redirect_to [@topic, @post] 
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end