module Api
  module V1
    class PostsController < ApiController

   skip_before_action :verify_authenticity_token
       

  def index
    @posts=Post.all
    render json: @posts
  end

  def show
    @post=Post.find_by(id: params[:id])
      if @post
        render json: @post, status: 200 
      else 
        render json: {
          error: "post not found..."
        }
      end
  end

  def create
   @post=Post.new(post_params)

    if @post.save
      render json: @post
    else
      render json:{
      error: "Error creating..."
      }
    end 
  end

  def update
    @post=Post.find(params[:id])

    if @post.update(post_params)
      render json: @post
    else
      render json:{
        error: "post not found..."
      }
    end
  end

  def destroy
     @post=Post.find(params[:id])
     
     if @post
        @post.destroy
        render json: "Article is deleted!"
     end
  end

  def post_params
    params.require(:post).permit(:title, :body, :status, :image, :category_id)
  end

    end
  end
end