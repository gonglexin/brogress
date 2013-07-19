class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    redirect_to items_path, notice: "Already Logged In"  if signed_in?
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to items_path, notice: "Welcome, #{user.name}"
    else
      flash[:error] = "Invalid email/password combination."
      redirect_to login_url
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
