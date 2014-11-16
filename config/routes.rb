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
  # resources :home


  #routes for home views
  get 'home', to: 'home#index', as: :home
  get 'error_page', to: 'home#error_page', as: :error
  get 'calendar', to: 'home#calendar', as: :calendar

  #routes for participants
  get 'junior_leaders', to: 'participants#junior_leaders', as: :junior_leaders
  get 'children', to: 'participants#children', as: :children
  get 'search', to: 'participant#search', as: :search

  #routes for ytd


end
