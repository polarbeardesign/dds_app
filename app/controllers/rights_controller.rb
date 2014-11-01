class RightsController < ApplicationController

  def index
    @rights = Right.ordered.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @rights }
    end
  end

  def show
    @right = Right.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @right }
    end
  end

  def new
    @right = Right.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @right }
    end
  end

  def create
    @right = Right.new(params[:right])

    respond_to do |format|
      if @right.save
        format.html { redirect_to @right, :notice => 'right was successfully created.' }
        format.json { render :json => @right, :status => :created, :location => @right }
      else
        format.html { render :action => "new" }
        format.json { render :json => @right.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @right = Right.find(params[:id])
  end

  # PUT /rights/1
  # PUT /rights/1.json
  def update
    @right = Right.find(params[:id])

    respond_to do |format|
      if @right.update_attributes(params[:right])
        format.html { redirect_to @right, :notice => 'Right was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @right.errors, :status => :unprocessable_entity }
      end
    end
  end


end