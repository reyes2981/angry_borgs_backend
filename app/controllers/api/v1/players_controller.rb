class Api::V1::PlayersController < ApplicationController

    def index
        players = Player.all
        render json: PlayerSerializer.new(players)
    end

    def create
        player = Player.create!(player_params)
             if player.save
                render json: { player: Player.new(player)}, status: :created
             else
                 render json: {
                      status: 500, 
                      errors: player.errors }
         end
    end
      

    def show
        player = Player.find(player_params)
            if player
                login
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
   

    private # review private methods - I think they are methods that only developer can access? 

    def player_params
        params.require(:player).permit(:username, :email)
    end

end