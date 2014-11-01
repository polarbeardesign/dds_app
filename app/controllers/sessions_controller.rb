class SessionsController < ApplicationController

skip_before_filter :check_authorization, :check_authentication

  def create
#    session[:user_id] = User.authenticate(params[:username], params[:password]).id 
#    session[:current_user] = User.authenticate(params[:username], params[:password]).id 
#      flash[:notice] = "Welcome back!" 
#      redirect_to :action => session[:intended_action],
#                  :controller => session[:intended_controller]
#    rescue Exception => e
#      redirect_to login_url, :alert => e.message
    
#    else
#      redirect_to login_url, :alert => "Invalid user/password combination"
#    end
  end

#self.current_user

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out"
  end
end