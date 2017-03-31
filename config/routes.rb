Rails.application.routes.draw do
  
  root 'static#index'
  get '/home', to: 'static#index' 
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  
  get '/users/:id/contacts', to: 'users#contacts'
  # post '/users/sign_up', to: 'users#create'


  get 'user_logs', to: 'logs#user_logs'
  get 'action_logs', to: 'logs#action_logs'

  resources :steps, :tags, :resources


  resources :companies do 
    resources :actions
  end

  resources :jobs do 
    resources :actions
  end

  resources :contacts do 
    resources :actions
  end

  resources :users do 
    resources :actions
  end
end
