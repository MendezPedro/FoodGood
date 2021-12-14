Rails.application.routes.draw do
  get 'dashboards/index'
  resources :donations
  post '/confirmation', to: 'donations#webhook'
  get '/mach/:id', to: 'donations#check_donation', as: 'check_donation'
  #se agrega una ruta extra a dashboard
  resources :dashboards do
    get :graphic, on: :member
  end

  resources :posts
  resources :comments
  post '/rate' => 'rater#create', :as => 'rate'
  get 'users/edit'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  devise_for :users, controller: {
  omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users
  resources :food_stores 
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
