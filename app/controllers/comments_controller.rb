class CommentsController < ApplicationController
	def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

      @comment.user_id=current_user.id

    if @comment.save
      respond_to do |format|
        format.html {redirect_to @post}
        format.js
      end
    end
  end
  

  def new
    @post=Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status, :parent_id, :like)
    end
end