class RolesController < ApplicationController

  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @roles }
    end
  end

  def show
    @role = Role.find(params[:id])
#    @grants = Grant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @role }
    end
  end

  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @role }
    end
  end

  def create
    @role = Role.new(params[:role])

    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, :notice => 'role was successfully created.' }
        format.json { render :json => @role, :status => :created, :location => @role }
      else
        format.html { render :action => "new" }
        format.json { render :json => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  # PUT /roles/1
  # PUT /roles/1.json
  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to @role, :notice => 'Role was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @role.errors, :status => :unprocessable_entity }
      end
    end
  end


end