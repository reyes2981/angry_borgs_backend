class SessionsController < ApplicationController

    def create
        player = Player.find_by(username: params[:_json])
            if player
                session[:player_id] = player.id
                render json: player
            else
                render json: { errors: ["Invalid username and/or email address"] }
            end

    end

    def destroy
        session.delete :player_id
        #head :no_content
    end

end