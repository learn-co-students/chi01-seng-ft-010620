class SessionsController < ApplicationController
  include SessionsHelper
  before_action :authorize!, except: [:new, :create]

  # Login
  def new

  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:message] = "Invalid credentials"
      redirect_to login_path
    end
  end

  # Logout
  def destroy
    p "LOGGING OUT"
    session[:user_id] = nil
    # session.delete(:user_id)
    redirect_to login_path
  end
end
