class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  helper_method :current_user


  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    return @current_user if @current_user
    nil
  end

  def log_in(user)
    session[:session_token] = user.session_token
  end

  def log_out
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def ensure_logged_in
    redirect_to new_session_url unless current_user
  end

  def ensure_logged_out
    redirect_to user_url(current_user) if current_user
  end
end
