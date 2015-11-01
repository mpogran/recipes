Rails.application.routes.draw do
  resources :users, except: [:index]

  get '/', to: 'dashboard#index', as: 'dashboard'

  # Session
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # Recipe
  resources :recipes

  # Container
  resources :containers, except: [:new, :edit]
end
