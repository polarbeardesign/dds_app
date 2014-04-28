class RideRequestsController < ApplicationController

skip_before_filter :check_authorization, :check_authentication, :only => [:new, :create, :show]

  # GET /ride_requests
  # GET /ride_requests.json
  def index
    #@ride_requests = RideRequest.all
    @airshows = Event.air_show.ordered.published.all
    @other = RideRequest.find_by_sql("SELECT `ride_requests`.* FROM `ride_requests` LEFT JOIN `events_ride_requests` ON `events_ride_requests`.`ride_request_id` = `ride_requests`.`id` WHERE (event_id IS NULL)")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ride_requests }
    end
  end

  # GET /ride_requests/1
  # GET /ride_requests/1.json
  def show
    @ride_request = RideRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ride_request }
    end
  end

  # GET /ride_requests/new
  # GET /ride_requests/new.json
  def new
    @ride_request = RideRequest.new
    @air_shows_public = Event.air_show.confirmed.ordered.published.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ride_request }
    end
  end

  # GET /ride_requests/1/edit
  def edit
    @ride_request = RideRequest.find(params[:id])
  end

  # POST /ride_requests
  # POST /ride_requests.json
  def create
    @ride_request = RideRequest.new(params[:ride_request])
    @air_shows_public = Event.air_show.confirmed.ordered.published.tease.all

    checked_air_shows = []
    checked_params = params[:air_show_list] || []
    for check_box_id in checked_params
      event = Event.find(check_box_id)
      if not @ride_request.events.include?(event)
        @ride_request.events << event
      end
      checked_air_shows << event
    end
    
    respond_to do |format|
      if @ride_request.save
        format.html { redirect_to @ride_request, :notice => 'Ride request was successfully created.' }
        format.json { render :json => @ride_request, :status => :created, :location => @ride_request }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ride_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ride_requests/1
  # PUT /ride_requests/1.json
  def update
    @ride_request = RideRequest.find(params[:id])
    @air_shows_public = Event.air_show.confirmed.ordered.published.tease.all

    checked_air_shows = []
    checked_params = params[:air_show_list] || []
    for check_box_id in checked_params
      event = Event.find(check_box_id)
      if not @ride_request.events.include?(event)
        @ride_request.events << event
      end
      checked_air_shows << event
    end
    missing_events = @air_shows_public - checked_air_shows
    for event in missing_events
      if @ride_request.events.include?(event)
        @@ride_request.events.delete(event)
      end
    end

    respond_to do |format|
      if @ride_request.update_attributes(params[:ride_request])
        format.html { redirect_to @ride_request, :notice => 'Ride request was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ride_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ride_requests/1
  # DELETE /ride_requests/1.json
  def destroy
    @ride_request = RideRequest.find(params[:id])
    @ride_request.destroy

    respond_to do |format|
      format.html { redirect_to ride_requests_url }
      format.json { head :ok }
    end
  end
end
