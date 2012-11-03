class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_authentication

  def check_authentication
    unless params[:controller] == 'devise/sessions' or params[:controller] == 'devise/passwords'
      unless current_user
        session[:intended_action] = action_name
        session[:intended_controller] = controller_name
        redirect_to login_path
      end
    end
  end

  before_filter :check_authorization

  private 

  def check_authorization
    unless params[:controller] == 'devise/sessions' or params[:controller] == 'devise/passwords'
      unless current_user.can?(action_name, controller_name)
        if !request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
          redirect_to :back, :notice => "You are not authorized to view the page you requested - "+action_name+" "+controller_name
        else
          redirect_to root_path, :notice => "You are not authorized to view the page you requested"
        end
      end
    end
  end

  def after_sign_in_path_for(resource)
   @user = current_user
   if user_signed_in?
     pages_member_home_path(resource)
   end
  end

end
