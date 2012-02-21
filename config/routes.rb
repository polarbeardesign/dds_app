DdsApp::Application.routes.draw do
  
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
