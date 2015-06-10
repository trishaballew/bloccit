class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    authorize @comment

    if @comment.save
      redirect_to [@topic, @post], notice: "Comment created successfully"
    else
      redirect_to [@topic, @post], notice: "Whoops something went wrong with the save"
    end

  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
    
    authorize @comment
    if @comment.destroy
      flash[:notice] =  "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end