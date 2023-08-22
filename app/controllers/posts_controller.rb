class PostsController < ApplicationController
 before_action :authenticate_user!
 before_action :get_post, only: [:show, :edit, :update, :destroy, :like, :duplicate]
	def index
		@posts=Post.all
	end

	def show
	end

	def new 
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user= current_user
		if @post.save 
		# UserMailer.with(user: current_user).welcome_email.deliver_now
			redirect_to @post
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit		
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@post.destroy

		redirect_to root_path, status: :see_other
	end

	def view
		@posts=Post.paginate(page: params[:page], per_page: 6)
	end

	def like
		Like.create(user_id: current_user.id, post_id: @post.id)
		redirect_to post_path(@post)
	end

	def duplicate
		@duplicate_post=@post.amoeba_dup
		if @duplicate_post.save
			redirect_to edit_post_path(@duplicate_post)
		else
			flash[:notice] = 'can\'t duplicate'
			redirect_to @duplicate_post
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :status, :image, :category_id, :first_tag, nested_forms_attributes: [:id, :input, :_destroy])
	end

	def get_post
		@post=Post.friendly.find(params[:id])
	end
	
end