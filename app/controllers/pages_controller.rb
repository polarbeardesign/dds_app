class PagesController < ApplicationController

skip_before_filter :check_authorization, :check_authentication, :only => [:home, :VMB612, :PBJs, :squadron, :map_0, :map_2013, :living_flight_history_experience, :refund_policy, :operations_2014]

# page views are hard coded in view files

  def home
    @events = Event.published.confirmed.ordered.tease
    @teaser = Teaser.current.limit(1).first
    render :layout => "homepage"
  end

  def VMB612
  end

  def PBJs

  end

  def living_flight_history_experience
    @rides = Event.published.ordered.has_lfhe
  end

  def refund_policy
  end

  def map_0
    render :layout => "map_layout"
  end

  def map_2013
    render :layout => "map_2013"
  end

  def operations_2014
    render :layout => "map_2014"
  end

  def F1
    @events = Event.published.ordered.tease
  end

  def seventieth_birthday_party
  end

  def squadron
    @events = Event.published.ordered.tease
    @terms = Term.current.ordered.all
    @officer_positions = OfficerPosition.all
  end

  def member_home
   @user = current_user
   @member = Member.find(@user.member)
  end

  def admin_home
   @user = current_user
  end

end
