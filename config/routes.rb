Mosh2::Application.routes.draw do
  namespace :admin do
    resources :users
  end

  resources :poster_statuses

  resources :posters do
    put "finish", "deny", "pend", "print"
  end

  resources :job_statuses

  resources :jobs do
    put "finish", "pend", "finalize"
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
  resources :poster_overview, only: [:index, :show]

  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root to: 'home#index'
end
