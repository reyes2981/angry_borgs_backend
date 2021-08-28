class Api::V1::PlayersController < ApplicationController
    
    def index
        players = Player.all
        render json: PlayerSerializer.new(players)
    end

    def create
        player = Player.find_or_create_by(:email => params[:email])
            if user && user.authenticate(params[:password])
                session[:player_id] = player.id
                render json: session
            else
        end
    end

   

    private

    def player_params
        params.require(:player).permit(:username, :email)
    end

end