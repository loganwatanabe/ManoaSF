SummerFun::Application.routes.draw do

  root :to => "home#index"
  

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


  #routes for home views
  match 'home' => 'home#index', :as => :home
  match 'error_page' => 'home#error_page', :as => :error
  match 'calendar' => 'home#calendar', :as => :calendar

  #routes for participants
  match 'junior_leaders' => 'participants#junior_leaders', :as => :junior_leaders
  match 'children' => 'participants#children', :as => :children
  match 'search' => 'participant#search', :as => :search

  #routes for ytd


end
