Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Venues
  get '/venues', to: 'venues#index'
  get '/venues/new', to: 'venues#new'
  get '/venues/:id', to: 'venues#show'
  post '/venues', to: 'venues#create'
  
  # Bands
  get '/bands', to: 'bands#index'
  get 'bands/new', to: 'bands#new'
  get '/bands/:id', to: 'bands#show'
  post '/bands', to:'bands#create'
  
end
