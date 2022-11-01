Rails.application.routes.draw do
  # get '/', to: 'sessions#index', as: 'root'

  #sessions 
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #create new users
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'

  resources :parcels
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
