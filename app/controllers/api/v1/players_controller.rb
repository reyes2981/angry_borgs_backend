class Api::V1::PlayersController < ApplicationController
    
    def index
        players = Player.all
        render json: PlayerSerializer.new(players)
    end

    def create

        player = Player.find_or_create_by(player_params)
        if player.save
            render({json: player, except: [:created_at, :updated_at]})
        else
            render json: player.errors, status: :unprocessable_entity
        end
    end

    private

    def player_params
        params.require(:player).permit(:name, :phone_number)
    end

end