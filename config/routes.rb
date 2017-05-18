Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  
  resource :search, only: [:create, :show]
  resources :tickets

  root to: 'searches#show'

   namespace :admin do
    resources :routes
    resources :railway_stations do
     patch :update_position, on: :member
     patch :update_time, on: :member
    end
    resources :trains do
     resources :wagons, shallow: true
    end
    resources :tickets
    resources :welcome, only: [:index]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
