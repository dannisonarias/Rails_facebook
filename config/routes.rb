Rails.application.routes.draw do
  
  root to: 'users#index'
  devise_for :users
  resources :users
  resources :posts
  resources :posts do
    resources :likes
    resources :comments
  end
  resources :friendships , only: [:create, :destroy,:update]
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
