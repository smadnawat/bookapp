Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :books
  namespace :api do
  	namespace :v1 do
  		resources :books
  		get "logout", "users/logout"
  		get "login", "users/login"
  		post "register", "users/register"
  	end
  end
end
