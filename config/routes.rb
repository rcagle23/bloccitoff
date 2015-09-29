Rails.application.routes.draw do
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "users#show"

  get '/users/confirm_email/:confirm_token' => 'users#confirm_email', as: 'confirm'

  resources :users, except: [:index] do
    resources :items, only: [:create]
  end

  resources :sessions
  resources :password_resets
end
