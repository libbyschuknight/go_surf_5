class SurfSpotsController < ApplicationController
  before_action :set_surf_spot, only: [:show, :edit, :update, :destroy]

  def index
    @surf_spots = SurfSpot.all
  end

  def show
  end

  def new
    @surf_spot = SurfSpot.new
  end

  def edit
  end

  def create
    @surf_spot = SurfSpot.new(surf_spot_params)

    if @surf_spot.save
      flash[:success] = "Surf spot was created."
      redirect_to @surf_spot
    else
      render "new"
    end
  end

  def update
    if set_surf_spot.update_attributes(surf_spot_params)
      flash[:success] = "Sirf spot was updated."
      redirect_to @surf_spot
    else
      render "new"
    end
  end

  def destroy
    set_surf_spot.destroy
    flash[:danger] = "Surf spot was deleted."
    redirect_to surf_spots_path
  end

  private

  def surf_spot_params
    params.require(:surf_spot).permit(
      :name,
      :description,
      :place,
      :region,
      :country,
      :latitude,
      :longitude,
      :stoke_rating
    )
  end

  def set_surf_spot
    @surf_spot = SurfSpot.find(params[:id])
  end
end
