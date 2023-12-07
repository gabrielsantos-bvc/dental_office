Rails.application.routes.draw do
  resources :dentists
  resources :clients, path: 'patients' do
    member do
      get :bookings
    end
  end
  resources :offices do
    member do
      post :booking
      get :bookings
      post :update_booking
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  post "login" => "clients#login"

  # Defines the root path route ("/")
  # root "posts#index"
end
