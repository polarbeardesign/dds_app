class MembersController < ApplicationController
  # GET /members
  # GET /members.json
  helper_method :sort_column, :sort_direction

  skip_before_filter :check_authorization, :check_authentication, :only => [:member_application,:member_application_received, :create]
  
  def index
    @active_members = Member.active.ordered
    @new_members = Member.find_by_sql("SELECT members.id, members.caf_col_no, members.caf_join_date, last_name, first_name, users.email FROM members LEFT JOIN users on users.id = user_id LEFT JOIN assignments ON assignments.user_id = members.user_id WHERE assignments.role_id IS NULL AND members.id > 144;")
    @inactive_members = Member.inactive.ordered
    @has_dues = @active_members.dues_most_recent.uniq
    @current_dues = @active_members.dues_most_recent.dues_current.uniq
    @past_dues = @active_members.dues_most_recent.dues_past.uniq
    
    respond_to do |format|
      format.html {render :layout => "homepage" }
      format.csv { render :text => Member.to_csv }
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

  # show member application profile
  def member_application_received
    @member = Member.find(params[:id])
    @products = Product.membership.all
    
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

  def account_new
    @member = Member.new
    user = @member.build_user
    @roles = Role.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @member }
    end
  end

  def member_application
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
    @dues_payments = DuesPayment.find_by_member_id(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member]) 
    @roles = Role.find(:all)

    checked_roles = []
    checked_params = params[:role_list] || []
    for check_box_id in checked_params
      role = Role.find(check_box_id)
      if not @member.user.roles.include?(role)
        @member.user.roles << role
      end
      checked_roles << role
    end

    respond_to do |format|
      if @member.save
        if params[:Submit] == "Submit Application" 
          MemberApplicationNotifier.created(@member).deliver
          format.html { redirect_to member_application_received_path(:id => @member), :notice => 'Application was successfully submitted and a copy has been emailed for your records.' }
          format.json { head :ok }
        else
          format.html { redirect_to @member, :notice => 'Member was successfully created.' }
          format.json { render :json => @member, :status => :created, :location => @member }
        end
      else
        if params[:Submit] == "Submit Application" 
          format.html { render :action => "member_application" }
        else
          format.html { render :action => "new" }
          format.json { render :json => @member.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])
#    @user = @member.user.id

    @roles = Role.find(:all)

if params[:commit] == "Update Member"
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
        if params[:commit] == "Update Member" 
          format.html { redirect_to @member, :notice => 'Member was successfully updated. #{undo_link}' }
          format.json { head :ok }
        else #params[:commit] == "Update Account" 
          format.html { redirect_to account_path(@member), :notice => 'Account was successfully updated.' }
          format.json { head :ok }
        end
      else
        if params[:commit] == "Update Member" 
          format.html { redirect_to account_path(@member) }#render :action => "edit" }
          format.json { render :json => @member.errors, :status => :unprocessable_entity }
        else #params[:commit] == "Update Account" 
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


def send_welcome_email

  @member = Member.find(params[:id])
  MembershipAddedNotifier.created(@member).deliver

  respond_to do |format|
    format.html { redirect_to @member, :notice => 'Member was successfully emailed welcome email.' }
  end

end



private
  def undo_link
    view_context.link_to("undo", revert_version_path(@product.versions.scoped.last), :method => :post)
  end

  def sort_column
    Member.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
