Rails.application.routes.draw do
  resources :posts
  post '/rate' => 'rater#create', :as => 'rate'
  get 'users/edit'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  devise_for :users
  resources :users
  resources :food_stores
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
