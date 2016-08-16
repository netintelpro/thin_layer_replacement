Rails.application.routes.draw do
  resources :case_studies
  root to: 'visitors#index'
  #devise_for :users
  resources :users
  resources :registrations
  resources :sessions
  delete "logout" => "sessions#destroy", :as => :logout
end
