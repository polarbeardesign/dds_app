class AircraftsController < ApplicationController
  # GET /aircrafts
  # GET /aircrafts.json
  def index
    @aircrafts = Aircraft.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @aircrafts }
    end
  end

  # GET /aircrafts/1
  # GET /aircrafts/1.json
  def show
    @aircraft = Aircraft.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @aircraft }
    end
  end

  # GET /aircrafts/new
  # GET /aircrafts/new.json
  def new
    @aircraft = Aircraft.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @aircraft }
    end
  end

  # GET /aircrafts/1/edit
  def edit
    @aircraft = Aircraft.find(params[:id])
  end

  # POST /aircrafts
  # POST /aircrafts.json
  def create
    @aircraft = Aircraft.new(params[:aircraft])

    respond_to do |format|
      if @aircraft.save
        format.html { redirect_to @aircraft, :notice => 'Aircraft was successfully created.' }
        format.json { render :json => @aircraft, :status => :created, :location => @aircraft }
      else
        format.html { render :action => "new" }
        format.json { render :json => @aircraft.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /aircrafts/1
  # PUT /aircrafts/1.json
  def update
    @aircraft = Aircraft.find(params[:id])

    respond_to do |format|
      if @aircraft.update_attributes(params[:aircraft])
        format.html { redirect_to @aircraft, :notice => 'Aircraft was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @aircraft.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /aircrafts/1
  # DELETE /aircrafts/1.json
  def destroy
    @aircraft = Aircraft.find(params[:id])
    @aircraft.destroy

    respond_to do |format|
      format.html { redirect_to aircrafts_url }
      format.json { head :ok }
    end
  end
end
