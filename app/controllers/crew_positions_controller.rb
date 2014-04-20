class CrewPositionsController < ApplicationController
  # GET /crew_positions
  # GET /crew_positions.json
  def index
    @crew_positions = CrewPosition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @crew_positions }
    end
  end

  # GET /crew_positions/1
  # GET /crew_positions/1.json
  def show
    @crew_position = CrewPosition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @crew_position }
    end
  end

  # GET /crew_positions/new
  # GET /crew_positions/new.json
  def new
    @crew_position = CrewPosition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @crew_position }
    end
  end

  # GET /crew_positions/1/edit
  def edit
    @crew_position = CrewPosition.find(params[:id])
  end

  # POST /crew_positions
  # POST /crew_positions.json
  def create
    @crew_position = CrewPosition.new(params[:crew_position])

    respond_to do |format|
      if @crew_position.save
        format.html { redirect_to @crew_position, :notice => 'Crew position was successfully created.' }
        format.json { render :json => @crew_position, :status => :created, :location => @crew_position }
      else
        format.html { render :action => "new" }
        format.json { render :json => @crew_position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /crew_positions/1
  # PUT /crew_positions/1.json
  def update
    @crew_position = CrewPosition.find(params[:id])

    respond_to do |format|
      if @crew_position.update_attributes(params[:crew_position])
        format.html { redirect_to @crew_position, :notice => 'Crew position was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @crew_position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /crew_positions/1
  # DELETE /crew_positions/1.json
  def destroy
    @crew_position = CrewPosition.find(params[:id])
    @crew_position.destroy

    respond_to do |format|
      format.html { redirect_to crew_positions_url }
      format.json { head :ok }
    end
  end
end
