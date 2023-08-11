Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :groups do
    resources :tasks
    resources :members
    resources :procedures do
      resources :stages
      resources :projects
    end
  end
  get '/procedures' => 'procedures#index', as: 'all_procedures'
  get '/projects' => 'projects#index', as: 'all_projects'

  get '/stages/:id/responsible_people/new' => 'responsible_people#new', as: 'stage_responsible_people'
  post '/stages/:id/responsible_people/new' => 'responsible_people#create'

  post '/group/archive/:group_id', to: 'groups#archive', as: 'archive_group'

  get '/next_stage/:project_id', to: 'projects#next_stage'
  get '/prev_stage/:project_id', to: 'projects#prev_stage'
  patch '/update_stage/:project_id', to: 'projects#update_stage'
  get 'profile/index'
  root 'pages#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
