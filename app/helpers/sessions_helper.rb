module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.id
    self.current_user = user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    if cookies[:remember_token]
      @current_user ||= User.find(cookies[:remember_token])
    else
      nil
    end
  end
end
