class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tweets = @user.profile.tweets
    @profile = @user.profile
  end

end
