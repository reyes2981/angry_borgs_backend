class Api::V1::PlayersController < ApplicationController
    
    def index
        players = Player.all
        render json: PlayerSerializer.new(players)
    end

    def show
        player = Playerplayer.find(params[:id])
            if player
               render json: {
            player: player
            }
            else
               render json: {
               status: 500,
               errors: ['player not found']
             }
            end
    end


    def create
        player = Player.find_or_create_by(player_params)
            if player.save
                login!
                render json: {
                    status: :created,
                    player: player
                }
            else
                render json: {
                     status: 500, 
                     errors: player.errors }
        end
    end

   

    private # review private methods - I think they are methods that only developer can access? 

    def player_params
        params.require(:player).permit(:username, :email, :password)
    end

end