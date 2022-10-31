Rails.application.routes.draw do
  get '/', to: 'sessions#index', as: 'root'
  get '/login', to: 'sessions#new', as: 'login'
  get '/me', to: 'users#show'
  post '/', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  resources :parcels
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
