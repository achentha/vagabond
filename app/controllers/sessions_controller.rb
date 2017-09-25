class SessionsController < ApplicationController
  def new
    if current_user
      flash[:error] = "You are already logged in"
      redirect_to user_path(current_user.name) and return
    end
    @user = User.new
  end

  def create
    if current_user
      flash[:error] = "You are already logged in"
      redirect_to user_path(current_user.name) and return
    end
      user_params = params.require(:user).permit(:name, :password)
      @user = User.confirm(user_params)
      if @user
        login(@user)
        redirect_to user_path(@user.name)
      else
        flash[:error] = "Wrong username/password"
        redirect_to login_path
      end
    end

  def destroy
    logout
    redirect_to root_path
  end


end
