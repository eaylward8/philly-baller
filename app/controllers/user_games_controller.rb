class UserGamesController < ApplicationController
  def index
    @user = current_user
    @upcoming_games = @user.games_next_30_days
    @past_games = @user.games_past_30_days
  end
end