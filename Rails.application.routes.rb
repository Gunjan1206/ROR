Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy]  # Admin User Management
    resources :stores, only: [:index, :new, :create, :edit, :update, :destroy] # Store Management
    get 'dashboard', to: 'dashboard#index'  # Admin Dashboard
  end

  resources :stores, only: [:index, :show] do
    resources :ratings, only: [:create, :update]  # Submit and modify ratings
  end

  namespace :store_owner do
    get 'dashboard', to: 'dashboard#index'  # Store Owner Dashboard
  end

  resources :users, only: [:edit, :update]  # Normal and Store Owner Password Change

  root to: "stores#index"  # Landing page for users to see store listings
end
