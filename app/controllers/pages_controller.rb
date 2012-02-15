class PagesController < ApplicationController
  def home
    @events = Event.all :order => 'start', :limit => 10
    render :layout => "homepage"
  end

  def vmb612
  end

  def PBJs
  end

  def squadron
  end

end
