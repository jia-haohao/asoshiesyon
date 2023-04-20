Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter" if Rails.env.development?
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
