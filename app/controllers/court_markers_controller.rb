class CourtMarkersController < ApplicationController

  def show
    @court = Court.find(params[:id])
    render json: {address: @court.full_address}
  end

end