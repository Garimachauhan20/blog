class CommentsController < ApplicationController
	def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    
    respond_to do |format|

      if @comment.save
        # format.html { render :comment, comment: @comment }
        format.js
      else
        # format.html { redirect_to @comment, alert: 'Comment could not be saved.' }
        format.js 
      end
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end