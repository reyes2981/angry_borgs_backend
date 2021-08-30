class ApplicationController < ActionController::API
    

def login
      session[:player_id] = player.id
end
def logged_in?
      !!session[:player_id]
end

def current_player
      current_player ||= player.find(session[:player_id]) if session[:player_id]
end
def authorized_player?
       player == current_player
end
def logout
       session.clear
end
def set_player
    player = player.find_by(id: session[:player_id])
end
end