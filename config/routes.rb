Rails.application.routes.draw do
  devise_for :users
  root 'static#index'
  get '/home', to: 'static#index' 
  resources :steps, :tags, :resources, :jobs, :contacts, :companies

  get 'user_logs', to: 'logs#user_logs'

  get 'action_logs', to: 'logs#action_logs'

  resources :users do 
    resources :actions
  end
end
