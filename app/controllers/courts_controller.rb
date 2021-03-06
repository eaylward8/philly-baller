class CourtsController < ApplicationController
  skip_before_action :authorized?, only: [:index, :show]

  def index
    create_philly_courts_from_api if Court.all.count < 200
    @courts = Court.sort_alphabetically
  end

  def show
    @court = Court.find(params[:id])
  end

  def create
    
  end

  private

    def create_philly_courts_from_api 
      adapter = Adapters::CourtClient.new
      adapter.class.get_data("aba9bbe0-9e46-44fc-aff8-f9a925f5256e", 1000, "basketball")
    end
end
