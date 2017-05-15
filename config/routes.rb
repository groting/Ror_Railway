Rails.application.routes.draw do
  resources :routes
  resources :railway_stations do
   patch :update_position, on: :member
   patch :update_time, on: :member
  end
  resources :trains do
   resources :wagons, shallow: true
  end
  resource :search, only: [:create, :show]
  resources :tickets



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
