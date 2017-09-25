class UsersController < ApplicationController
  before_action :verify_user, only: [:edit, :update]
  def index
    @users = Array.new
    User.all[0..5].each do |user|
      @users << user
    end
  end

  def new
    if current_user
      flash[:error] = "You cannot sign up while you are logged in."
      redirect_to current_user and return
    end
    @user = User.new
  end

  def create
    if current_user
      flash[:error] = "You cannot sign up while you are logged in."
      redirect_to current_user and return
    end
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_path(@user.name)
    else
      flash[:error] = @user.errors.full_messages.join(" ")
      render new_user_path
    end
  end

  def show
    @user = User.find_by(name: params[:username])
    if @user == nil
      flash[:error] = "User does not exist"
      redirect_to root_path
    end

  end

  def edit
    @user = User.find_by(name: params[:username])
  end

  def update
    @user = User.find_by(name: params[:username])
    if @user.update(user_params)
      redirect_to user_path(@user.name)
    else
      flash[:error] = @user.errors.full_messages.join(" ")
      redirect_to user_path(@user.name)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :current_city, :password, :avatar)
  end

  def verify_user
    if current_user[:name].to_s != params[:username].to_s
      flash[:notice] = "No permission to edit other user information"
      redirect_to user_path
    end
  end

end
