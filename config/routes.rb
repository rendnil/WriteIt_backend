Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :update, :create]
      resources :users, only: [:index, :create]
      post "/login", to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end




# fetch("http://localhost:3000/api/v1/users",{
#   method: "POST",
#   headers:{
#     "Accept": "application/json",
#     "Content-Type": "application/json"
#   },
#   body:JSON.stringify({
#     user:{
#       username:"andrew",
#       password:"hey"
#     }
#     })})
# .then(r=>r.json())
# .then(r=>console.log(r))
