

class FollowersController < ApplicationController


  def create
    @follower = Follower.new(follower_id: current_user.id, user_id: params[:user_id])
    if @follower.save
      redirect_to tweets_url
    end
  end

  def destroy
  end
end
