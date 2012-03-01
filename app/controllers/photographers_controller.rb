class PhotographersController < ApplicationController
  # GET /photographers
  # GET /photographers.xml
  def index
    @photographers = Photographer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photographers }
    end
  end

  # GET /photographers/1
  # GET /photographers/1.xml
  def show
    @photographer = Photographer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photographer }
    end
  end

  # GET /photographers/new
  # GET /photographers/new.xml
  def new
    @photographer = Photographer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photographer }
    end
  end

  # GET /photographers/1/edit
  def edit
    @photographer = Photographer.find(params[:id])
  end

  # POST /photographers
  # POST /photographers.xml
  def create
    @photographer = Photographer.new(params[:photographer])

    respond_to do |format|
      if @photographer.save
        format.html { redirect_to(@photographer, :notice => 'Photographer was successfully created.') }
        format.xml  { render :xml => @photographer, :status => :created, :location => @photographer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photographer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photographers/1
  # PUT /photographers/1.xml
  def update
    @photographer = Photographer.find(params[:id])

    respond_to do |format|
      if @photographer.update_attributes(params[:photographer])
        format.html { redirect_to(@photographer, :notice => 'Photographer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photographer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photographers/1
  # DELETE /photographers/1.xml
  def destroy
    @photographer = Photographer.find(params[:id])
    @photographer.destroy

    respond_to do |format|
      format.html { redirect_to(photographers_url) }
      format.xml  { head :ok }
    end
  end
end
