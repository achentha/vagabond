class CommentsController < ApplicationController
	before_action :verify_logged_in, except: [:show]
	before_action :find_and_verify_user, only: [:edit, :update, :destroy]

  # Format files to be readable!
  # This is not a hippie-dippie recommendation so your code 'looks pretty' –
  # your future teammates will not enjoy working in your code if they need to spend time
  # indenting and spacing out your code before they can understand it.

  # Also is a tell-tale sign of how much experience you have / how much you care about your code.
	def new
		@comment = Comment.new
		@post = Post.find(params[:id])
	end

	def create
		@comment = Comment.new comment_params
		@comment.user = current_user
		@comment.post = Post.find(params[:id])
		if @comment.save
			redirect_to @comment.post
		else
			flash[:error] = @comment.errors.full_messages.join(" ")
			redirect_to new_comment_path
		end
	end

	def edit
	end

	def update
		if @comment.update comment_params
  		redirect_to @comment.post
  	else
  		flash[:error] = @comment.errors.full_messages.join(" ")
  		redirect_to @comment.post
  	end
	end

	def destroy
		@comment.delete
  	redirect_to Post.find(params[:id])
	end

	private

	def comment_params
		params.require(:comment).permit(:content,:post,:user)
	end

  # May be nice to remove these to the comments_helper.rb file,
  # as this file is getting long-ish 
	def verify_logged_in
  	if !current_user
  		flash[:error] = "You must be logged in to create or modify comments"
  		redirect_to Post.find(params[:id]) and return
  	end
  end

  def find_and_verify_user
  	@comment = Comment.find(params[:comment_id])
  	if current_user != @comment.user
  		flash[:error] = "You don't have permission to modify other users' comments"
  		redirect_to @comment.post and return
  	end
  end
end
