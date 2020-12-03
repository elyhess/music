Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Venues
  get '/venues', to: 'venues#index'
  get '/venues/new', to: 'venues#new'
  get '/venues/:id', to: 'venues#show'
  get '/venues/:id/edit', to: 'venues#edit'
  post '/venues', to: 'venues#create'
  patch '/venues/:id', to: 'venues#update'
  delete '/venues/:id', to: 'venues#destroy'
  
  # Bands
  get '/bands', to: 'bands#index'
  get '/bands/new', to: 'bands#new'
  get '/bands/:id', to: 'bands#show'
  get '/bands/:id/edit', to: 'bands#edit'
  post '/bands', to:'bands#create'
  patch '/bands/:id', to: 'bands#update'
  delete '/bands/:id', to: 'bands#destroy'
  
  # Events
  get '/events', to: 'events#index'

  # Members
  get '/members', to: 'members#index'

  #BandMembers
  get '/bands/:id/members', to: 'band_members#index'
end
