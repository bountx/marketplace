class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @reviews = @profile.reviews
  end
end
