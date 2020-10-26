Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit] do
    member do
      get :photos
    end
  end
  
  put 'users/:id/edit', to: 'users#edit'
  
  patch '/users/:id', to: 'users#update'
  
  resources :photos, only: [:new] 
  resources :posts, only: [:create, :destroy]
  resources :skills, only: [:create, :edit, :destroy]
end