Rails.application.routes.draw do
  resources :case_studies
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
