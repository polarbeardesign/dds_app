class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_authorization

  private 
  def check_authorization
    unless user.can?(action_name, controller_name)
      redirect_to :back,
                  :error => "You are not authorized to view the page you requested"
    end
  end

end
