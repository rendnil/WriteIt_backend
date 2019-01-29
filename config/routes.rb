Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :update, :create]
      resources :votes, only: [:index, :create]
      resources :comments, only: [:index, :create]
      resources :users, only: [:index, :create]
      post "/login", to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
