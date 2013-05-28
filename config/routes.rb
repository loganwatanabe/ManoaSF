SummerFun::Application.routes.draw do

  
  get "home/index"

  get "home/_sidebar"

  get "home/error_page"

  resources :absences
  resources :phone_numbers
  resources :orders
  resources :yummy_tummy_day_orders
  resources :meals
  resources :users
  resources :groups
  resources :contacts
  resources :leaders
  resources :participants
  resources :home

  root :to => "home#index"

  #routes for home views
  match 'home' => 'home#index', :as => :home
  match 'error_page' => 'home#error_page', :as => :error

  #routes for participants
  match 'junior_leaders' => 'participants#junior_leaders', :as => :junior_leaders
  match 'children' => 'participants#children', :as => :children
  match 'search' => 'participant#search', :as => :search

  #routes for ytd
  match 'ytd' => 'yummy_tummy_day_orders_path', :as => :ytd


end
