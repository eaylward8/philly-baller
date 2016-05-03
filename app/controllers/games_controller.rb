class GamesController < ApplicationController
  skip_before_action :authorized?, only: [:index, :show]
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
      current_user.games << @game
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

  private

    def game_params
      params.require(:game).permit(:court_id, :date, :time)
    end

end
