Mosh2::Application.routes.draw do

  resources :poster_statuses


  resources :posters


  resources :job_statuses


  resources :jobs do
    put "finish", "deny"
    resources :posters
  end


  resources :work_orders


  resources :order_statuses


  resources :after_hours_accesses


  resources :semesters


  resources :terms

  resources :locations do
    resources :workstations
  end
  resources :location_types
  resources :hardwares
  resources :hardware_statuses
  resources :hardware_types
  resources :workstations do
    resources :hardwares
  end
  resources :workstation_types
  resources :hours
  resources :lab_overview, only: :index
  resources :inventory, only: :index
  devise_for :users
  root to: 'home#index'
end
