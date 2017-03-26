Rails.application.routes.draw do
  resources :steps
  resources :tags
  resources :resources
  resources :users
  resources :jobs
  resources :actions
  resources :contacts
  resources :orgs
  root 'welcome#index'
end
