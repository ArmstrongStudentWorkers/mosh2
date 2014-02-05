Mosh2::Application.routes.draw do
  namespace :admin do
    resources :users
  end

  resources :poster_statuses


  resources :posters do
    put "finish", "deny", "pend"
  end


  resources :job_statuses


  resources :jobs do
    put "finish", "deny", "pend"
    resources :posters
  end


  resources :work_orders


  resources :order_statuses


  resources :after_hours_accesses


  resources :semesters


  resources :terms

  resources :locations do
    resources :workstations
    resources :after_hours_accesses
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
