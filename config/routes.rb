Rails.application.routes.draw do
  resources :users, except: [:index]

  get '/', to: 'home#index', as: 'home'

  # Session
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # Recipe
  resources :recipes

  # Container
  resources :containers, except: [:new, :edit]
end
