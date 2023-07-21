class CommentsController < ApplicationController
	def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    respond_to do |format|
      if @comment.save

        counter = @post.comments.count
        format.turbo_stream do 
          render turbo_stream: [
          turbo_stream.replace('comment_form', partial: 'comments/form', locals: { comment: Comment.new }),
          turbo_stream.replace('comment_count', partial: 'comments/count', locals: { counter: counter})
         ]
        end
        format.html { render partial: 'comments/form', locals: { comment: Comment.new }}
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('comment_form', partial: 'comments/form', locals: { comment: @comment }) }
        format.html { render partial: 'comments/form', locals: { comment: @comment }}
      end
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end