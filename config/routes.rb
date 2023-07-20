Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :groups do
    resources :tasks
    resources :members
  end

  get 'profile/index'  
  root 'groups#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
