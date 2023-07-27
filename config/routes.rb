Rails.application.routes.draw do

  devise_for :users

  root "posts#index"
  get "/posts/view", to: 'posts#view'
  
  resources :posts do 
    resources :comments 
  end

  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :show, :create,:update, :destroy]
    end
  end

end
