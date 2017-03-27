

class SessionsController < ApplicationController
  before_action :ensure_logged_out, only: [:new, :create]
  before_action :ensure_logged_in, only: [:destroy]

  def new
    render :new
  end

  def create
    username = session_params[:username]
    password = session_params[:password]
    @user = User.find_by_credentials(username, password)
    if @user
      log_in(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end

end
