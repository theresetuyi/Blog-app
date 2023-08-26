Rails.application.routes.draw do
  root to: "users#index"
    resources :users, only: [:index, :show]
    post 'comment/new/:post_id', to: 'comment#create' 
    resources :posts, only: [:index, :show, :create, :new] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
    get '/posts/:id', to: 'posts#show', as: 'post_show'
  end