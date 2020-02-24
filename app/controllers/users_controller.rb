class UsersController < ApplicationController
# skip_before_action :authorized, only: [:new, :create]
def new
   @user = User.new
end
def create
  p params
  @user = User.new(user_params)
  if params[:user][:password] == params[:user][:password_confirmation]
    p params[:user][:password_confirmation]
    p params[:user][:password]
      @user = User.save
      # session[:user_id] = @user.id
      flash[:success] = "Signup Successfully"
      redirect_to login_path
  else
      flash[:danger] = "Password_confirmation must be same as password"
       render "users/new"
      # redirect_to new_user_path
  end
end

private

def user_params
  p "=============================="
  p params[:user][:password]
  p "======================="
  params.require(:user).permit(:username, :email, :password)
end
end
