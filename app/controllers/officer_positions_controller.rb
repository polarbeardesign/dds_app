class OfficerPositionsController < ApplicationController
  # GET /officer_positions
  # GET /officer_positions.json
skip_before_filter :check_authorization, :check_authentication

  def index
    @officer_positions = OfficerPosition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @officer_positions }
    end
  end

  # GET /officer_positions/1
  # GET /officer_positions/1.json
  def show
    @officer_position = OfficerPosition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @officer_position }
    end
  end

  # GET /officer_positions/new
  # GET /officer_positions/new.json
  def new
    @officer_position = OfficerPosition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @officer_position }
    end
  end

  # GET /officer_positions/1/edit
  def edit
    @officer_position = OfficerPosition.find(params[:id])
  end

  # POST /officer_positions
  # POST /officer_positions.json
  def create
    @officer_position = OfficerPosition.new(params[:officer_position])

    respond_to do |format|
      if @officer_position.save
        format.html { redirect_to @officer_position, :notice => 'Officer position was successfully created.' }
        format.json { render :json => @officer_position, :status => :created, :location => @officer_position }
      else
        format.html { render :action => "new" }
        format.json { render :json => @officer_position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /officer_positions/1
  # PUT /officer_positions/1.json
  def update
    @officer_position = OfficerPosition.find(params[:id])

    respond_to do |format|
      if @officer_position.update_attributes(params[:officer_position])
        format.html { redirect_to @officer_position, :notice => 'Officer position was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @officer_position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /officer_positions/1
  # DELETE /officer_positions/1.json
  def destroy
    @officer_position = OfficerPosition.find(params[:id])
    @officer_position.destroy

    respond_to do |format|
      format.html { redirect_to officer_positions_url }
      format.json { head :ok }
    end
  end
end
