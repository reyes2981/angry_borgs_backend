class SessionsController < ApplicationController

    def create
        # byebug
        player = Player.find_by(email: params[:_json])
            if player
                session[:player_id] = player.id
                render json: player
            else
                render json: { errors: ["Invalid playe rname"] }, status: :unauthorized
            end

    end

    def destroy
        session.delete :player_id
        head :no_content
    end
    


end