Rails.application.routes.draw do
  devise_for :users  
  root to: "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create] 
  end

  post 'comment/new/:post_id', to: 'comment#create' 
  resources :posts, only: [:show] do
    resources :comments, only: [:create, :new]
    resources :likes, only: [:create]
  end

  get '/posts/:id', to: 'posts#show', as: 'post_show'
end
