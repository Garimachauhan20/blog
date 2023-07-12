Rails.application.routes.draw do
  root "posts#index"
  get "/posts/view", to: 'posts#view'
  get '/comments/comment', to: 'comments#create'

  resources :posts do 
    resources :comments
  end
end
