class SessionsController < ApplicationController

  def create
    session[:user_id] = User.authenticate(params[:username], params[:password]).id 
	@current_user = User.authenticate(params[:username], params[:password]).id 
    flash[:notice] = "Welcome back!" 
    redirect_to :action => session[:intended_action],
                :controller => session[:intended_controller]
  end

self.current_user

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out"
  end
end