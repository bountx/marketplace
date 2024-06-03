class ProfilesController < ApplicationController
  def show
    @user=current_user
    @profile = Profile.find(params[:id])
    @reviews = @profile.reviews
  end
end
