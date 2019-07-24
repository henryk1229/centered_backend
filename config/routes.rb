Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'profile', to: "users#profile"
      post '/login', to: "auth#login"
      post '/signup', to: "users#create"
      resources :users
      resources :themes
      resources :userthemes
    end
  end
end
