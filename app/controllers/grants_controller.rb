class GrantsController < ApplicationController

  def index
    @grants = Grant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @grants }
    end
  end

  def show
    @grant = Grant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @grant }
    end
  end

  def new
    @grant = Grant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @grant }
    end
  end

  def create
    @grant = Grant.new(params[:grant])

    respond_to do |format|
      if @grant.save
        format.html { redirect_to @grant, :notice => 'right was successfully created.' }
        format.json { render :json => @grant, :status => :created, :location => @grant }
      else
        format.html { render :action => "new" }
        format.json { render :json => @grant.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @grant = Grant.find(params[:id])
  end

  # PUT /grants/1
  # PUT /grants/1.json
  def update
    @grant = Grant.find(params[:id])

    respond_to do |format|
      if @grant.update_attributes(params[:grant])
        format.html { redirect_to @grant, :notice => 'Grant was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @grant.errors, :status => :unprocessable_entity }
      end
    end
  end


end