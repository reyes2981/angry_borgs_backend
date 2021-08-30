class Api::V1::PlayersController < ApplicationController

    def index
        players = Player.all
        render json: PlayerSerializer.new(players)
    end

    def create
        player = Player.create(player_params)
        @player = Player.create(player_params)
        if @player.save
          render json: { player: PlayerSerializer.new(@player)}, status: :created
        else
          render json: {error: "Could not create user"}, status: :unprocessible_entity
        end
    end
      

    def show
        player = Player.find(player_params)
         
    end
   

    private # review private methods - I think they are methods that only developer can access? 

    def player_params
        params.require(:player).permit(:username, :email)
    end

end