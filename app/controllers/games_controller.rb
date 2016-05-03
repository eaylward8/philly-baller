class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    # need to associate user with the game
    @game = Game.new(game_params)
    binding.pry
    if @game.save
      render "show"
    else
      render "create"
    end
  end

  private

    def game_params
      params.require(:game).permit(:court_id, :date, :time)
    end

end
