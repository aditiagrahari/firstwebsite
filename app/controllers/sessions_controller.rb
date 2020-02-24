class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:logout, :welcome]
  def new
  end
  def login
  end
  def create
     @user = User.find_by(username: params[:username])
     if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Successfully logged in"
        redirect_to welcome_path
     else
       flash[:danger] = "Invalid Username and Password"
        redirect_to login_path
     end
  end
  def page_requires_login
  end
  def logout
    session[:user_id] = nil
    flash[:success] = "You have logout Successfully"
    redirect_to login_path
  end
end
