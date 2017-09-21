class PostsController < ApplicationController

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
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update post_params
  		redirect_to @post
  	else
  		flash[:error] = @post.errors.full_messages.join(" ")
  		redirect_to @post
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.delete
  	redirect_to current_user
  end

  private
  def post_params
  	params.require(:post).permit(:title,:content,:user,:city)
  end
end
