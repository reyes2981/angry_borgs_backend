class Api::V1::PlayersController < ApplicationController

    def index
        players = Player.all
        render json: PlayerSerializer.new(players)
    end

    def new
        player = Player.new
    end

    def show
        player = Player.find(params[:id])
    end

    def create
        player = Player.create(player_params)
        if player.save
          render json: { player: PlayerSerializer.new(player)}, status: :created
        else
          render json: {error: "Could not create player"}, status: :unprocessible_entity
        end
    end
      


    def delete
          player = Player.find_by(id: params[:id])
          player.destroy
          head :no_content
      end
   

    private # review private methods - I think they are methods that only developer can access? 

    def player_params
        params.require(:player).permit(:username, :email)
    end

end