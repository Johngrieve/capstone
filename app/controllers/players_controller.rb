class PlayersController < ApplicationController
  def index
    @players = Player.all
    render :index
  end

  def create
    @player = Player.new(
      valorant_name: params["valorant_name"],
      character: params["character"],
      role: params["role"],
      rank: params["rank"],
      image_url: params["image_url"],
      user_id: current_user.id,
    )
    if @player.save
      render template: "players/show"
    else
      render json: { errors: @player.errors.full_messages }, status: 422
    end
  end

  def show
    player_id = params[:id]
    @player = Player.find_by(id: player_id)
    render template: "players/show"
  end
end
