class CommentsController < ApplicationController
	def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    if @comment.save
      respond_to do |format|
        format.html {redirect_to @post}
        format.js
      end
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end