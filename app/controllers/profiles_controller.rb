class ProfilesController < ApplicationController
  
  before_action :validate_user, except: [:new, :create]
  
  def new
    @profile = Profile.new
  end
  
  def create
    Profile.create(profile_params)
  end
  
  def edit
    @profile = Profile.find(params[:id])
  end
  
  def update
    profile = Profile.find(params[:id])
    profile.update(profile_params)
    redirect_to controller: 'users', action: 'show', id: current_user.id
  end
  
  private
  def profile_params
    params.require(:profile).permit(:study_code, :pc_os, :introduction, :image).merge(user_id: current_user.id)
  end
  
  def validate_user
    profile = Profile.find(params[:id])
    unless user_signed_in? && current_user.id == profile.user_id
    redirect_to :root
    end
  end

end
