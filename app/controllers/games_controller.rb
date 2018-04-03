class GamesController < ApplicationController
  def new
    @game = Game.new
    @opponent_options = User.where.not(id: current_user.id).collect { |m| [m.email, m.id] }
  end

  def create
    debugger
  end

  private

  def game_params
    params.require(:game)
          .permit(:opponent,
                  :your_score,
                  :their_score,
                  :date_played
                )
  end

end
