class TweetsController < ApplicationController
  
  before_action :user_validate, except: [:new, :create, :index]
  
  def index
    @tweets = Tweet.includes(:profile).order("created_at DESC").page(params[:page]).per(5)
    if user_signed_in?
      @profile = Profile.find_by(user_id: current_user.id)
    end
  end
  
  def new
    if user_signed_in?
    @tweet = Tweet.new
    @profile = Profile.find_by(user_id: current_user.id)
    else
      redirect_to 'users/sign_in'
    end
  end
  
  def create
    Tweet.create(tweet_params)
    redirect_to :root
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
    @profile = Profile.find_by(user_id: current_user.id)
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    redirect_to :root
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.delete
    redirect_to :root
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:theme, :text, :image).merge(profile_id: current_user.profile.id)
  end
  
  def user_validate
    @tweet = Tweet.find(params[:id])
    unless user_signed_in? && @tweet.profile.user_id == current_user.id
    redirect_to :root
    end
  end
end
