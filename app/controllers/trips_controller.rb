class TripsController < ApplicationController
  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])
    @event = Event.find_by_id(@trip.event_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @trip }
    end
  end

  def trip_financials
    @trip = Trip.find(params[:id])
    @event = Event.find_by_id(@trip.event_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new
    @event = Event.find(params[:event_id])
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
    @event = Event.find_by_id(@trip.event_id)
  end

  def update_events
    event = Event.find(params[:event_id])
    
    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render :json => @trip }
    end
  end


  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(params[:trip])
    @event = Event.find(@trip.event_id)
    
    respond_to do |format|
      if @trip.save
			if params[:email_notice].to_s == "1"
         TripInfoNotifier.created(@trip).deliver
      end
      format.html { redirect_to @trip, :notice => 'Trip was successfully created.' }
        format.json { render :json => @trip, :status => :created, :location => @trip }
      else
        format.html { render :action => "new", :event_id => @event.id }#render :action => "new" }
        format.json { render :json => @trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
				if params[:email_notice].to_s == "1"
					TripInfoNotifier.change(@trip).deliver
				end
        format.html { redirect_to @trip, :notice => 'Trip was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :ok }
    end
  end
end
