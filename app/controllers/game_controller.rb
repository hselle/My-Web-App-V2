require 'soundcloud'
class GameController < ApplicationController

  def game_params
    params.require(:game).permit(:users, :songs, :winner, :loser, :genre, :start_time, :end_time)
  end
  
  
end