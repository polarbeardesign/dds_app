class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_authentication

def current_user
  current_user = session[:current_user]
end

def check_authentication
  unless current_user
  session[:intended_action] = action_name 
  session[:intended_controller] = controller_name
  redirect_to login_path
end

end

  before_filter :check_authorization

  private 
  def check_authorization
    
#    unless User.find(session[:current_user]).can?(action_name, controller_name)
#      redirect_to :back,
#                  :notice => "You are not authorized to do "+action_name+" "+controller_name
#    end
  end

end
