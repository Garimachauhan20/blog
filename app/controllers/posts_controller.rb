class PostsController < ApplicationController
 before_action :authenticate_user!
	def index
		@posts=Post.all
	end

	def show
		@post=Post.find(params[:id])
	end

	def new 
		@post = Post.new
		@post.nested_forms.build
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@post=Post.find(params[:id])
	end

	def update
		@post=Post.find(params[:id])
		if @post.update(post_params)
			redirect_to @post
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@post=Post.find(params[:id])
		@post.destroy

		redirect_to root_path, status: :see_other
	end

	def view
		@posts=Post.all
	end
	
	def post_params
		params.require(:post).permit(:title, :body, :status, :image, :category_id, :first_tag, nested_forms_attributes: %i[id input _destroy])
	end
	

end