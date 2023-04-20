Rails.application.routes.draw do
  root to: "pictures#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy, :index]
  resources :users, only: [:new, :create, :show, :edit,:update, :destroy]
  resources :pictures do 
    collection do
      post :confirm
    end
  end
end
