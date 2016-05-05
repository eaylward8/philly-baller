class CourtMarkersController < ApplicationController
  skip_before_action :authorized?, only: [:show]

  def show
    @court = Court.find(params[:id])
    render json: {address: @court.full_address('address'), site_name: @court.full_address('site_name')}
  end

end