

class TweetsController < ApplicationController

  def new
    render :new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)

    if @tweet.save
      redirect_to tweets_url
    else
      flash[:errors] = @tweet.errors.full_messages
      redirect_to new_user_tweet_url
    end
  end

  def index
    @tweets = current_user.tweets
    render :index

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
