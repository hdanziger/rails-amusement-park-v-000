Rails.application.routes.draw do
root "welcome#home"

get '/signin', to: 'sessions#new'
 post '/sessions/create', to: 'sessions#create'
 post '/signout', to: 'sessions#destroy'

resources :attractions 
resources :users

post '/rides/new', to: "rides#new"

end