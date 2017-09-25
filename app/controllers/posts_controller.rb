class PostsController < ApplicationController
	before_action :verify_logged_in, except: [:show]
	before_action :find_and_verify_user, only: [:edit, :update, :destroy]

  def new
  	@post = Post.new
  	@city = City.find_by(name: params[:cityname])
  end

  def create
  	@post = Post.new post_params
  	@post.user = current_user
  	@post.city = City.find_by(name: params[:cityname])
  	if @post.save
  		redirect_to @post
  	else
  		flash[:error] = @post.errors.full_messages.join(" ")
  		redirect_to new_post_path
  	end
  end

  def show
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(@post.user_id)
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
  	redirect_to user_path(current_user.name)
  end

  private
  
  def post_params
  	params.require(:post).permit(:title,:content,:user,:city)
  end

  def verify_logged_in
  	if !current_user
  		flash[:error] = "You must be logged in to create or modify posts"
  		redirect_to City.find_by(name: params[:cityname]) and return
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
