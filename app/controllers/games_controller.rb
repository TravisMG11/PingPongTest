class GamesController < ApplicationController
  def index
  end

  def new
    @opponent_options = User.where.not(id: current_user.id).collect { |m| [m.email, m.id] }
  end

  def create
    Game.create(game_attributes)
    redirect_to :new_game
  end

  def game_attributes
    if game_params[:your_score].to_i > game_params[:their_score].to_i
      {
        winner_id: current_user.id,
        loser_id: game_params[:opponent_id],
        winner_score: game_params[:your_score].to_i,
        loser_score: game_params[:their_score].to_i,
        date: game_params[:date_played]
      }
    else
      {
        winner_id: game_params[:opponent_id],
        loser_id: current_user.id,
        winner_score: game_params[:their_score].to_i,
        loser_score: game_params[:your_score].to_i,
        date: game_params[:date_played]
      }
    end
  end

  private

  def game_params
    params.require(:game)
          .permit(:opponent_id,
                  :your_score,
                  :their_score,
                  :date_played
                )
  end

end
