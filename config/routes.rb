DdsApp::Application.routes.draw do

  scope "/~devildog" do
    resources :news
    resources :events
    resources :event_types
    match 'calendar'        => 'events#index', :as => :calendar
    match "pages/home"      => 'pages#home'
    match "pages/VMB612"    => 'pages#VMB612'
    match "pages/PBJs"      => 'pages#PBJs'
    match "pages/squadron"  => 'pages#squadron'
    root :to => 'pages#home'
  end

end
