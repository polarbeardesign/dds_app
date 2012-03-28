class TeasersController < ApplicationController
  # GET /teasers
  # GET /teasers.xml
  def index
    @teasers = Teaser.current.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @teasers }
    end
  end

  # GET /teasers/1
  # GET /teasers/1.xml
  def show
    @teaser = Teaser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @teaser }
    end
  end

  # GET /teasers/new
  # GET /teasers/new.xml
  def new
    @teaser = Teaser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @teaser }
    end
  end

  # GET /teasers/1/edit
  def edit
    @teaser = Teaser.find(params[:id])
  end

  # POST /teasers
  # POST /teasers.xml
  def create
    @teaser = Teaser.new(params[:teaser])

    respond_to do |format|
      if @teaser.save
        format.html { redirect_to(@teaser, :notice => 'Teaser was successfully created.') }
        format.xml  { render :xml => @teaser, :status => :created, :location => @teaser }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @teaser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teasers/1
  # PUT /teasers/1.xml
  def update
    @teaser = Teaser.find(params[:id])

    respond_to do |format|
      if @teaser.update_attributes(params[:teaser])
        format.html { redirect_to(@teaser, :notice => 'Teaser was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @teaser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teasers/1
  # DELETE /teasers/1.xml
  def destroy
    @teaser = Teaser.find(params[:id])
    @teaser.destroy

    respond_to do |format|
      format.html { redirect_to(teasers_url) }
      format.xml  { head :ok }
    end
  end
end
