

class UsersController < ApplicationController
  before_action :ensure_logged_out, only: [:create, :new]
  before_action :ensure_logged_in, only: [:destroy]

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render :show
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to users_url
    end
  end

  def edit
  end

  def update
  end
  

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
