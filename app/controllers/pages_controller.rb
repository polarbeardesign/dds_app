class PagesController < ApplicationController

skip_before_filter :check_authorization

  def home
    @events = Event.published.ordered.tease
    @teaser = Teaser.current.limit(1).first
    render :layout => "homepage"
  end

  def vmb612
  end

  def PBJs
  end

  def squadron
  end

end
