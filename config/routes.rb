Rails.application.routes.draw do
  root "posts#index"
  get "/posts/view", to: 'posts#view'

  resources :posts do 
    resources :comments
  end
end
