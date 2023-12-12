Rails.application.routes.draw do
  scope "auth" do
    get "/" => "auth#index"
    get "callback" => "auth#callback"
    get "logout" => "auth#logout"
  end
  scope "admin" do
    get "/" => "admin#index"
    get "console" => "admin#console"
  end
  resources :set_scores, only: [:index, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "scoreboard#index"
end
