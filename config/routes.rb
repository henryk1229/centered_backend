Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post '/login', to: "auth#login"
      post '/signup', to: "users#create"
      get 'profile', to: "users#profile"
      resources :users
      resources :themes
      resources :userthemes
    end
  end
end
