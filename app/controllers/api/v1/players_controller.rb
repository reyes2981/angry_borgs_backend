class Api::V1::PlayersController < ApplicationController
    
    def index
        players = Player.all
        render json: PlayerSerializer.new(players)
    end

    def create
        player = Player.create!(username: params[:_json])
        session[:player_id] = player.id
        render json: player, status: :created
    end
  
    def show
        render json: @current_player
    end

    def delete
        @player = Player.find_by(id: params[:id])
        @player.destroy

        #head :no_content
    end

end