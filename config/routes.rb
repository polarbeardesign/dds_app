DdsApp::Application.routes.draw do
  
  resources :photos

  resources :photographers

  resources :galleries

  resources :gallery_categories

  resources :news

  resources :events

  resources :event_types

  match 'calendar' => 'events#index', :as => :calendar

  get "pages/home"
  get "pages/VMB612"
  get "pages/PBJs"
  get "pages/squadron"
  
  root :to => 'pages#home'

end
