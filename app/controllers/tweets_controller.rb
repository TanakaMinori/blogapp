class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all.order("created_at DESC")
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    Tweet.create(tweet_params)
    redirect_to :root
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:theme, :text, :image_id)
  end
end