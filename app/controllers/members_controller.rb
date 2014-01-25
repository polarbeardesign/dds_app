class MembersController < ApplicationController
  # GET /members
  # GET /members.json
  def index
    @members = Member.ordered.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @members }
    end
  end

  # members view of membership list
  def members_list
    @members = Member.active.ordered.all
    @user = current_user
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @member }
    end
  end

  # show member account profile
  def account
    @member = Member.find(params[:id])
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @member }
    end
  end

  def account_edit
    @member = Member.find(params[:id])
    @user = current_user
  end

  def update_pwd
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to account_path(@user.member.id), :notice => 'Password was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new
    user = @member.build_user
     @roles = Role.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
    @roles = Role.find(:all)
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, :notice => 'Member was successfully created.' }
        format.json { render :json => @member, :status => :created, :location => @member }
      else
        format.html { render :action => "new" }
        format.json { render :json => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])
#    @user = @member.user.id

    @roles = Role.find(:all)

if params["Update Member"] 
    checked_roles = []
    checked_params = params[:role_list] || []
    for check_box_id in checked_params
      role = Role.find(check_box_id)
      if not @member.user.roles.include?(role)
        @member.user.roles << role
      end
      checked_roles << role
    end
    missing_roles = @roles - checked_roles
    for role in missing_roles
      if @member.user.roles.include?(role)
        @member.user.roles.delete(role)
      end
    end
end

    respond_to do |format|
      if @member.update_attributes(params[:member])
        if params["Update Member"] 
          format.html { redirect_to @member, :notice => 'Member was successfully updated.' }
          format.json { head :ok }
        elsif params["Update Account"] 
          format.html { redirect_to account_path(@member), :notice => 'Account was successfully updated.' }
          format.json { head :ok }
        end
      else
        if params["Update Member"] 
          format.html { redirect_to account_path(@member) }#render :action => "edit" }
          format.json { render :json => @member.errors, :status => :unprocessable_entity }
        elsif params["Update Account"] 
          format.html { redirect_to account_path(@member) }#render :action => "edit" }
          format.json { render :json => @member.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :ok }
    end
  end
end
