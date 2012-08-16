DdsApp::Application.routes.draw do



  resources :posts

  resources :categories

  resources :email_addresses

  resources :members
  
  resources :rights
  
  resources :grants

  resources :roles

  resources :users

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

  resources :event_signups

  match 'calendar' => 'events#index', :as => :calendar
  
  match 'px' => 'products#px', :as => :px

  match 'members_list' => 'members#members_list', :as => :members_list

  match 'account/:id' => 'members#account', :as => :account
  
  match 'account_edit/:id' => 'members#account_edit', :as => :account_edit

  match 'change_password/:id' => 'users#change_password', :as => :change_password

match 'photo_viewer' => 'galleries#photo_viewer', :as => :photo_viewer
  
  get "pages/home"
  get "pages/VMB612"
  get "pages/PBJs"
  get "pages/squadron"
  get "pages/thank_you"
  get "pages/member_home"
  
  root :to => 'pages#home'

   match ':controller(/:action(/:id(.:format)))'
end
