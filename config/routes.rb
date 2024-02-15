Rails.application.routes.draw do
  root "posts#index"
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :facebook_posts, only: [:create]
end
