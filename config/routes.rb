Rails.application.routes.draw do
  resources :case_studies do
    collection do
      post :import
    end
  end
  root to: 'visitors#index'
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  resources :users

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :case_studies
    end
  end
  get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')


end
