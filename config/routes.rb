Rails.application.routes.draw do
  get 'replies/create'

  devise_for :users

  root "posts#index"
  get "/posts/view", to: 'posts#view'
  
  resources :posts do 
    resources :comments
  end
  
  resources :nested_forms, only: [], param: :index do
    member do 
      delete '(:id)' => "nested_forms#destroy", as: ""
      post '/' => "nested_forms#create"

    end
  end  


  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :show, :create,:update, :destroy]
    end
  end

end
