Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do   
      resources :players, only: [:index, :show]
        # Create new players
      get  '/signup',  to: 'players#new'
      post '/signup',  to: 'players#create'
      # Sessions
      get    '/login',   to: 'sessions#new'
      post   '/login',   to: 'sessions#create'
      delete '/logout',  to: 'sessions#destroy'
    end
  end
end

# PLAYER LOG IN
