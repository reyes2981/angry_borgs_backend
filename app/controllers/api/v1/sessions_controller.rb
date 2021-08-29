class SessionsController < ApplicationController

    # POST request 
    def create
        player = Player.find_by(username: params[:_json])
            if player
                log_in
                session[:player_id] = player.id
                render json: player
            else
                render json: { errors: ["Invalid username and/or email address"] }
            end

    end


end