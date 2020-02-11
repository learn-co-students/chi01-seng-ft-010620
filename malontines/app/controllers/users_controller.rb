class UsersController < ApplicationController
  include SessionsHelper
  before_action :redirect_snoopers, only: :show
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user
  end

  def show
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
    @user = User.find(params[:id])
  end

  private

  def redirect_snoopers
    if current_user
      redirect_to current_user if params[:id] != current_user.id
    else
      redirect_to login_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
