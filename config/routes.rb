Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit] 
  
  put 'users/:id/edit', to: 'users#edit'
  
  put '/users/:id', to: 'users#update'
  get 'users/:id/edit', to: 'users#edit'
  
  resources :posts
  resources :skills, only: [:create, :edit, :destroy]
end