class Api::V1::PlayersController < ApplicationController

    def create
        player = Player.find_or_create_by(player_params)
        if player.save
            render({json: player, except: [:password_digest, :created_at, :updated_at]})
        else
            render json: player.errors, status: :unprocessable_entity
        end
    end

    def show

    end
    
    def player_params
        params.require(:player).permit(:username, :email)
    end

end
