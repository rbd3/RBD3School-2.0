Rails.application.routes.draw do
  resources :students
  resources :subjects
  resources :teachers
  resources :users
  resources :class_assignments
  resources :class_teachers
  resources :student_subjects
  resources :subject_coefficients
  resources :teaching_assignments

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "class_assignments#create"
   #root "class_assignments#index"

   namespace :api do
    resources :class_assignments, only: [:index, :create]
  end

end
