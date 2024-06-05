
class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def show
    @profile = Profile.find(params[:id])
    @reviews = @profile.reviews
  end

  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Product was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:bio)
  end
end
