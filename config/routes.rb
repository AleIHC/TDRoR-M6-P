Rails.application.routes.draw do
  resources :ei_jobs do
    resources :ei_applications, only: [:new, :create, :index]
  end
  resources :ei_applications, only: :index 
  resources :ei_profiles

  devise_for :ei_users, controllers: {
    registrations: 'ei_users/registrations'
  }

  # Add a route for displaying the ei_user's applications
  get '/ei_applications', to: 'ei_applications#index', as: 'ei_user_applications'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/ei_admin/dashboard', to: 'ei_admin_dashboard#index', as: 'ei_admin_dashboard'

  # Defines the root path route ("/")
  root "home#index"
end
