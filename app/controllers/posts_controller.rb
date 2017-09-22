class PostsController < ApplicationController
	before_action :verify_logged_in, except: [:show]
	before_action :find_and_verify_user, only: [:edit, :update, :destroy]
  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
  	@post = Post.new
  	@city = City.find(params[:id])
  end

  def create
  	@post = Post.new post_params
  	@post.user = current_user
  	@post.city = City.find(params[:id])
  	if @post.save
  		redirect_to @post
  	else
  		flash[:error] = @post.errors.full_messages.join(" ")
  		redirect_to new_post_path
  	end
  end

  def edit
  	
  end

  def update
  	if @post.update post_params
  		redirect_to @post
  	else
  		flash[:error] = @post.errors.full_messages.join(" ")
  		redirect_to @post
  	end
  end

  def destroy
  	@post.delete
  	redirect_to current_user
  end

  private
  def post_params
  	params.require(:post).permit(:title,:content,:user,:city)
  end

  def verify_logged_in
  	if !current_user
  		flash[:error] = "You must be logged in to create or modify posts"
  		redirect_to City.find(params[:id]) and return
  	end
  end

  def find_and_verify_user
  	@post = Post.find(params[:id])
  	if current_user != @post.user
  		flash[:error] = "You don't have permission to modify other users' posts"
  		redirect_to @post and return
  	end
  end
end
