class SessionsController < ApplicationController

    # POST request 
    def create
        player = Player.find_by(username: session_params[:username])
        if player && player.authenticate(session_params[:email])
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

    # logs in player
    def logged_in?
        if logged_in? && current_player
          render json: {
            logged_in: true,
            player: current_player
          }
        else
          render json: {
            logged_in: false,
            message: 'no such player'
          }
        end
    end

    # ends session 
    def destroy
          logout
          render json: {
            status: 200,
            logged_out: true
          }
    end



end