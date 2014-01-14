class EventSignupsController < ApplicationController
  # GET /event_signups
  # GET /event_signups.json

skip_before_filter :check_authorization, :check_authentication

  def index
    @event_signups = EventSignup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @event_signups }
    end
  end

  # GET /event_signups/1
  # GET /event_signups/1.json
  def show
    @event_signup = EventSignup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @event_signup }
    end
  end

  # GET /event_signups/new
  # GET /event_signups/new.json
  def new
    @event_signup = EventSignup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event_signup }
    end
  end

  # GET /event_signups/1/edit
  def edit
    @event_signup = EventSignup.find(params[:id])
  end

  # POST /event_signups
  # POST /event_signups.json
  def create
    @event_signup = EventSignup.new(params)

    respond_to do |format|
      if @event_signup.save
        format.html { redirect_to event_path(params[:event_id]), :notice => 'Event signup was successfully created.' }
        format.json { render :json => @event_signup, :status => :created, :location => @event_signup }
      else
        format.html { render :action => "new" }
        format.json { render :json => @event_signup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /event_signups/1
  # PUT /event_signups/1.json
  def update
    @event_signup = EventSignup.find(params[:id])

    respond_to do |format|
      if @event_signup.update_attributes(params[:event_signup])
        format.html { redirect_to @event_signup, :notice => 'Event signup was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event_signup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /event_signups/1
  # DELETE /event_signups/1.json
  def destroy
    @event_signup = EventSignup.find(params[:id])
    @event_signup.destroy

    respond_to do |format|
      format.html { redirect_to event_signups_url }
      format.json { head :ok }
    end
  end
end
