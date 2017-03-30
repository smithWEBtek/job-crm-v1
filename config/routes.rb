Rails.application.routes.draw do
  
  root 'static#index'
  
  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  
  
  get '/home', to: 'static#index' 
  
  get '/users/:id/contacts', to: 'users#contacts'
  # post '/users/sign_up', to: 'users#create'

  resources :steps, :tags, :resources, :jobs, :contacts, :companies

  get 'user_logs', to: 'logs#user_logs'
  get 'action_logs', to: 'logs#action_logs'

  resources :users do 
    resources :actions
  end
end
