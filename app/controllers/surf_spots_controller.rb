class SurfSpotsController < ApplicationController
  def index
    @surf_spots = SurfSpot.all
  end

  def show
    @surf_spot = SurfSpot.find(params[:id])
  end

  def new
    @surf_spot = SurfSpot.new
  end

  def edit
    @surf_spot = SurfSpot.find(params[:id])
  end

  def create
    @surf_spot = SurfSpot.new(surf_spot_params)

    @surf_spot.save
    redirect_to @surf_spot
  end

  def update
    @surf_spot = SurfSpot.find(params[:id])

    if @surf_spot.update(surf_spot_params)
      redirect_to @surf_spot
    else
      render "edit"
    end
  end

  def destroy
    @surf_spot = SurfSpot.find(params[:id])
    @surf_spot.destroy

    redirect_to surf_spots_path
  end

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
end
