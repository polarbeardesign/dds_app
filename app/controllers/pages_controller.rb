class PagesController < ApplicationController

skip_before_filter :check_authorization, :check_authentication, :only => [:home, :VMB612, :PBJs, :squadron, :map_0,]

  def home
    @events = Event.published.ordered.tease
    @teaser = Teaser.current.limit(1).first
    render :layout => "homepage"
  end

  def VMB612
  end

  def PBJs
  end

  def map_0
    render :layout => "map_layout"
  end

  def F1
    @events = Event.published.ordered.tease
  end

  def squadron
    @events = Event.published.ordered.tease
  end

  def member_home
   @user = current_user
  end

end
