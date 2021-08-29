Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  namespace :api do
    namespace :v1 do   
      resources :players, only: [:index, :create, :show]
    end
  end
end

# PLAYER LOG IN
