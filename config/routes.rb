Rails.application.routes.draw do
  
  root 'static#index'
  get '/home', to: 'static#index' 
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  
  get '/users/:id/contacts', to: 'users#contacts'
  # post '/users/sign_up', to: 'users#create'


  get '/user_logs', to: 'logs#user_logs'
  get '/todo_logs', to: 'logs#todo_logs'
  get '/admin_todos', to: 'todos#admin'

  resources :steps, :tags, :resources

  resources :companies do 
    # resources :todos
  end

  resources :jobs do 
    # resources :todos
  end

  resources :contacts do 
    # resources :todos
  end

  resources :users do 
    resources :todos
  end
end
