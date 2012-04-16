DdsApp::Application.routes.draw do



  resources :videos

  match 'video_gallery' => 'videos#video_gallery', :as => :video_gallery

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
    get 'logout' => :destroy
  end

  resource :sessions
  
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
