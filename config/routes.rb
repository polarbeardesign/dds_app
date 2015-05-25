DdsApp::Application.routes.draw do

  resources :test_submission_responses

  resources :test_submissions
  match 'knowledge_exam' => 'test_submissions#knowledge_exam', :as => :knowledge_exam

  resources :test_answers

  resources :test_questions

  resources :knowledge_tests

  get "test_submissions/knowledge_exam"
  match 'knowledge_exam' => 'test_submissions#knowledge_exam', :as => :knowledge_exam
  match 'grade_course_test/:id' => 'test_submissions#grade_course_test', :as => :grade_course_test

  resources :testanswers

  resources :testquestions

  resources :knowledgetests

  resources :ride_requests

  resources :trips
  
  match 'trip_financials/:id' => 'trips#trip_financials', :as => :trip_financials

  resources :squadron_documents

  resources :document_categories

  resources :officer_positions

#  devise_for :users

#  devise_scope :user do
#    get "login", :to => "devise/sessions#new"
#    get "update_password", :to => "devise/passwords#edit"
#  end

devise_for :users, :skip => [:registrations]                                          
    as :user do
      get "login", :to => "devise/sessions#new"
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
      put 'users' => 'devise/registrations#update', :as => 'user_registration'            
    end

  post "versions/:id/revert" => "versions#revert", :as => "revert_version"

  resources :locations

  resources :terms

  resources :posts

  resources :categories

  resources :email_addresses

#  resources :members

  resources :members do
    resources :versions, :only => [:destroy] do
      member do
        get 'diff', :to => 'versions#diff'
        put 'rollback', :to => 'versions#rollback'
      end
    end
  end
  
  resources :rights
  
  resources :grants

  resources :roles

  resources :users

  resources :videos

  match 'video_gallery' => 'videos#video_gallery', :as => :video_gallery

 # controller :sessions do
 #   get 'login' => :new
 #   post 'login' => :create
 #   delete 'logout' => :destroy
 #   get 'logout' => :destroy
 # end

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
  match 'all_events' => 'events#all_events', :as => :all_events

  
  match 'px' => 'products#px', :as => :px
  
  match 'F1' => 'pages#F1', :as => :F1
  match 'f1' => 'pages#F1', :as => :f1
  
  match 'seventieth_birthday_party' => 'pages#seventieth_birthday_party', :as => :seventieth_birthday_party

  match 'arsenal_of_democracy' => 'pages#arsenal_of_democracy', :as => :arsenal_of_democracy

  match 'trips/update_events', :as => 'update_events'
  
  match 'edit_signup/:id' => 'event_signups#edit_signup', :as => :edit_signup

  match 'edit_rsvp/:id' => 'attendances#edit_rsvp', :as => :edit_rsvp

  match 'members_list' => 'members#members_list', :as => :members_list
  
  match 'frequent_flyers' => 'event_signups#frequent_flyers', :as => :frequent_flyers

  match 'frequent_flyer_detail/:member_id' => 'event_signups#frequent_flyer_detail', :as => :frequent_flyer_detail

  match 'account/:id' => 'members#account', :as => :account
  
  match 'account_edit/:id' => 'members#account_edit', :as => :account_edit

  match 'change_password/:id' => 'users#change_password', :as => :change_password

match 'photo_viewer' => 'galleries#photo_viewer', :as => :photo_viewer
  
  match 'refund_policy' => 'pages#refund_policy', :as => :refund_policy

#match '/time_off_feed/:id/time_off_feed', to: 'day_offs#time_off_feed', :as => 'time_off_feed_path'

match 'member_feed' => 'events#member_feed', :as => :member_feed

  
  get "pages/home"
  get "pages/VMB612"
  get "pages/PBJs"
  match 'living_flight_history_experience' => 'pages#living_flight_history_experience', :as => :living_flight_history_experience
  match 'hold_harmless/:event_id' => 'event_signups#hold_harmless', :as => :hold_harmless

  get "pages/map_0"
  get "pages/map_2103"
  get "pages/operations_2014"
  get "pages/squadron"
  get "pages/thank_you"
  get "pages/member_home"
  get "pages/admin_home"

  root :to => 'pages#home'

   match ':controller(/:action(/:id(.:format)))'
end
