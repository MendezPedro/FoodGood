Rails.application.routes.draw do
  resources :donations
  post '/confirmation', to: 'donations#webhooh'
  get '/mach', to: 'donations#check_donation' as: 'check_donation'
  
  resources :posts
  resources :comments
  post '/rate' => 'rater#create', :as => 'rate'
  get 'users/edit'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  devise_for :users, controller: {
  omniauth_callback: "users/omniauth_callback"}
  resources :users
  resources :food_stores
  get 'users/graphic' 
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
