Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  resources :cats
  root "pages#home"
  get 'about', to: 'pages#about'

  get 'login', to: 'sessions#new'       # For displaying the login form
  post 'login', to: 'sessions#create'   # For submitting the login form
  delete 'logout', to: 'sessions#destroy'  # For logging out the user
  
  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

end
