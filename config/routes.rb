Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do   
      resources :players, only: [:index, :show]
      get  '/signup',  to: 'players#new'
      post '/signup',  to: 'players#create'
    end
  end
end

# PLAYER LOG IN
