Rails.application.routes.draw do
  resources :case_studies do
    collection do
      post :import
    end
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
