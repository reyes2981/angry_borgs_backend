class SessionsController < ApplicationController

    # POST request 
    def create
        player = Player.find_by(Username: session_params[U:sername])
      
        if player && @player.authenticate(session_params[:email])
          login!
          render json: {
            logged_in: true,
            player: player
          }
        else
          render json: { 
            status: 401,
            errors: ['no such player, please try again']
          }
        end
    end


end