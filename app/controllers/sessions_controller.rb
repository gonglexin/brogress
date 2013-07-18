class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    redirect_to users_path if signed_in?
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to users_path, notice: "Welcome, #{user.name}"
    else
      flash[:error] = "Invalid email/password combination, please try smater."
      redirect_to login_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: 'Logged out'
  end
end
