class Api::V1::PlayersController < ApplicationController
    
    def index
        players = Player.all
        render json: PlayerSerializer.new(players)
    end

    def create
        player = Player.find_or_create_by(email: params['player']['email'],
        username: params['player']['username'],
        password: params['password']['password'],
      )
            if player.save
                session[:player_id] = player.id
                render json: { 
                    status success: 'success',
                    player: player
                }
            else
                render json: { status: 500, errors: player.errors }
        end
    end

    def show
        if player
            render json:PlayerSerializer.new(player)
        else 
            render json: { messages: "Player could not be found"}
        end
    end

    private

    def player_params
        params.require(:player).permit(:username, :email, :password)
    end

end