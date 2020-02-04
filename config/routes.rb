Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: redirect('/flights')
  get '/flights', to: 'flights#index'
  get '/bookings/new', to: 'bookings#new'
  get '/bookings/:id', to: 'bookings#show'
  resources :bookings
  resources :passengers

end
