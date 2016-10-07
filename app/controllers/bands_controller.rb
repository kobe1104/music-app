class BandsController < ApplicationController
  def index
  end

  def create
  end

  def show
    @band = Band.find(params[:id])
    @albums = @band.albums
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
