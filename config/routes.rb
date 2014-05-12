Mosh2::Application.routes.draw do
  resources :settings do
    put "toggle"
  end

  namespace :admin do
    resources :users
  end

  resources :poster_statuses

  resources :posters do
    put "finish", "pend", "print"
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
    resources :workstations, only: [:index, :new, :create]
  end

  resources :location_types
  resources :hardwares, except: [:new, :create]
  resources :hardware_statuses
  resources :hardware_types

  resources :workstations, except: [:new, :create] do
    resources :hardwares, only: [:index, :new, :create]
  end

  resources :workstation_types
  resources :hours
  resources :lab_overview, only: :index
  resources :inventory, only: :index

  namespace :api do
    namespace :v1 do
      resources :labs, only: [:index, :show] do
        resources :workstations, only: :index
      end
      resources :workstations, only: :show do
        resources :hardwares, only: [:index, :new, :create]
      end
      resources :hardwares, only: :show
    end
  end

  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root to: 'home#index'
end
