Rails.application.routes.draw do
  devise_for :users
  root 'static#index'
  get '/home', to: 'static#index' 
  resources :steps, :tags, :resources, :jobs, :contacts, :companies

  resources :users do 
    resources :actions
  end
end
