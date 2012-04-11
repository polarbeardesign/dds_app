DdsApp::Application.routes.draw do



  controller :session do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resource :session
  
  resources :teasers

  resources :products

  resources :photos

  resources :photographers

  resources :galleries do
    resources :photos
  end

  resources :gallery_categories

  resources :news

  resources :events

  resources :event_types

  match 'calendar' => 'events#index', :as => :calendar
  
  match 'px' => 'products#px', :as => :px

  get "pages/home"
  get "pages/VMB612"
  get "pages/PBJs"
  get "pages/squadron"
  get "pages/thank_you"
  
  
  root :to => 'pages#home'

   match ':controller(/:action(/:id(.:format)))'
end
