class PagesController < ApplicationController
  def home
    @events = Event.published :order => 'start', :limit => 7
    render :layout => "homepage"
  end

  def vmb612
  end

  def PBJs
  end

  def squadron
  end

end
