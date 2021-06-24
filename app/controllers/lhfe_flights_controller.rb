class LhfeFlightsController < ApplicationController

skip_before_filter :check_authorization, :check_authentication, :only => [:show, :living_history_flight_experience]

  # GET /lhfe_flights
  # GET /lhfe_flights.json
  def index
    @lhfe_flights = LhfeFlight.upcoming

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @lhfe_flights }
    end
  end

  # GET /lhfe_flights/1
  # GET /lhfe_flights/1.json
  def show
    @lhfe_flight = LhfeFlight.find(params[:id])
    @price = Product.find_by_id(11)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @lhfe_flight }
    end
  end

  def living_history_flight_experience
  
    @content = Content.find_by_id(3)
    @rides = Event.published.ordered.has_lhfe
    @price = Product.find_by_id(11)
  
  end

  # GET /lhfe_flights/new
  # GET /lhfe_flights/new.json
  def new
    @lhfe_flight = LhfeFlight.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @lhfe_flight }
    end
  end

  # GET /lhfe_flights/1/edit
  def edit
    @lhfe_flight = LhfeFlight.find(params[:id])
  end

  # POST /lhfe_flights
  # POST /lhfe_flights.json
  def create
    @lhfe_flight = LhfeFlight.new(params[:lhfe_flight])

    respond_to do |format|
      if @lhfe_flight.save
        format.html { redirect_to @lhfe_flight, :notice => 'Lhfe flight was successfully created.' }
        format.json { render :json => @lhfe_flight, :status => :created, :location => @lhfe_flight }
      else
        format.html { render :action => "new" }
        format.json { render :json => @lhfe_flight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lhfe_flights/1
  # PUT /lhfe_flights/1.json
  def update
    @lhfe_flight = LhfeFlight.find(params[:id])

    respond_to do |format|
      if @lhfe_flight.update_attributes(params[:lhfe_flight])
        format.html { redirect_to @lhfe_flight, :notice => 'Lhfe flight was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @lhfe_flight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lhfe_flights/1
  # DELETE /lhfe_flights/1.json
  def destroy
    @lhfe_flight = LhfeFlight.find(params[:id])
    @lhfe_flight.destroy

    respond_to do |format|
      format.html { redirect_to lhfe_flights_url }
      format.json { head :ok }
    end
  end
end
