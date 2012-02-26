class PagesController < ApplicationController
  def home
    @events = Event.published.recent :order => 'start ASC', :limit => 7
    render :layout => "homepage"
  end

  def vmb612
  end

  def PBJs
  end

  def squadron
  end

end
