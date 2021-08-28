Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :session, only:[:create]
  namespace :api do
    namespace :v1 do   
      resources :players, only: [:index, :create, :show]
    end
  end
end

# PLAYER LOG IN
