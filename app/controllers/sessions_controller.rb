

class SessionsController < ApplicationController

  def new
    
  end

  def create
  end

  def destroy
  end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end

end
