class ManifestsController < ApplicationController
  # GET /manifests
  # GET /manifests.json
  def index
    @manifests = Manifest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @manifests }
    end
  end

  # GET /manifests/1
  # GET /manifests/1.json
  def show
    @manifest = Manifest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @manifest }
    end
  end

  # GET /manifests/new
  # GET /manifests/new.json
  def new
    @manifest = Manifest.new
    @event = Event.find(178)
    @crew_positions = CrewPosition.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @manifest }
    end
  end

  # GET /manifests/1/edit
  def edit
    @manifest = Manifest.find(params[:id])
  end

  # POST /manifests
  # POST /manifests.json
  def create
    @manifest = Manifest.new(params[:manifest])

    respond_to do |format|
      if @manifest.save
        format.html { redirect_to @manifest, :notice => 'Manifest was successfully created.' }
        format.json { render :json => @manifest, :status => :created, :location => @manifest }
      else
        format.html { render :action => "new" }
        format.json { render :json => @manifest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /manifests/1
  # PUT /manifests/1.json
  def update
    @manifest = Manifest.find(params[:id])

    respond_to do |format|
      if @manifest.update_attributes(params[:manifest])
        format.html { redirect_to @manifest, :notice => 'Manifest was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @manifest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /manifests/1
  # DELETE /manifests/1.json
  def destroy
    @manifest = Manifest.find(params[:id])
    @manifest.destroy

    respond_to do |format|
      format.html { redirect_to manifests_url }
      format.json { head :ok }
    end
  end
end
