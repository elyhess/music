Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Venues
  get '/venues', to: 'venues#index'
  get '/venues/:id', to: 'venues#show'

  # Bands
  get '/bands', to: 'bands#index'
  get '/bands/:id', to: 'bands#show'
  
end
