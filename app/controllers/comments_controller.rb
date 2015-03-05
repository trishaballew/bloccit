def create
  @post = Post.find(params[:post_id])
  @comment = @post.comments.create(current_user)
end