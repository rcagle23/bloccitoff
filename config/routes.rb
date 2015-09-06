Rails.application.routes.draw do
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "application#root"
  
  resources :users do
    member do
      get :confirm_email
    end
  end
  resources :sessions
  resources :password_resets
end
