class DuesPaymentsController < ApplicationController
  # GET /dues_payments
  # GET /dues_payments.json
  def index
    @dues_payments = DuesPayment.ordered.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @dues_payments }
    end
  end

  # GET /dues_payments/1
  # GET /dues_payments/1.json
  def show
    @dues_payment = DuesPayment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @dues_payment }
    end
  end

  # GET /dues_payments/new
  # GET /dues_payments/new.json
  def new
    @dues_payment = DuesPayment.new(:member_id=>params[:member])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @dues_payment }
    end
  end

  # GET /dues_payments/1/edit
  def edit
    @dues_payment = DuesPayment.find(params[:id])
  end

  # POST /dues_payments
  # POST /dues_payments.json
  def create
    @dues_payment = DuesPayment.new(params[:dues_payment])

    respond_to do |format|
      if @dues_payment.save
        format.html { redirect_to @dues_payment, :notice => 'Dues payment was successfully created.' }
        format.json { render :json => @dues_payment, :status => :created, :location => @dues_payment }
      else
        format.html { render :action => "new" }
        format.json { render :json => @dues_payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dues_payments/1
  # PUT /dues_payments/1.json
  def update
    @dues_payment = DuesPayment.find(params[:id])

    respond_to do |format|
      if @dues_payment.update_attributes(params[:dues_payment])
        format.html { redirect_to @dues_payment, :notice => 'Dues payment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @dues_payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dues_payments/1
  # DELETE /dues_payments/1.json
  def destroy
    @dues_payment = DuesPayment.find(params[:id])
    @dues_payment.destroy

    respond_to do |format|
      format.html { redirect_to dues_payments_url }
      format.json { head :ok }
    end
  end

  def dues_reminders_list
    @dues_reminders = DuesPayment.find_by_sql("SELECT dp.id, dp.member_id, dp.date_paid 
                                                FROM (SELECT MAX(id) AS id, member_id, MAX(date_paid) as date_paid 
                                                FROM dues_payments
                                                GROUP BY member_id) as dp
                                                WHERE dp.date_paid between 
                                                DATE_ADD(LAST_DAY(DATE_SUB(NOW(), INTERVAL 16 MONTH)), INTERVAL 1 DAY) AND 
                                                LAST_DAY(DATE_SUB(NOW(), INTERVAL 11 MONTH));")
    @date_start = (Time.zone.now - 16.month).end_of_month + 1.day
    @date_end = (Time.zone.now - 11.month).end_of_month

    respond_to do |format|
      format.html # dues_reminders.html.erb
      format.json { render :json => @dues_payment }
    end
  end

  def dues_reminders_past_due_list
    @dues_reminders = DuesPayment.find_by_sql("SELECT id, member_id, payment_method, payment_type, amt_paid, 
                                       date_paid, notes FROM dues_payments WHERE date_paid BETWEEN DATE_ADD(LAST_DAY(DATE_SUB(NOW(), INTERVAL 15 MONTH)), INTERVAL 1 DAY) 
                                       AND LAST_DAY(DATE_SUB(NOW(), INTERVAL 13 MONTH)) ORDER BY date_paid;")
    respond_to do |format|
      format.html # dues_reminders.html.erb
      format.json { render :json => @dues_payment }
    end
  end

def send_dues_reminder

  @dues_payment = DuesPayment.find(params[:id])
  @dues_reminder = DuesReminder.new
  @dues_reminder.member_id = @dues_payment.member_id
  @dues_reminder.sent_to = @dues_payment.member.user.email
  @dues_reminder.notice_name = "Dues Reminder"
  @dues_reminder.save
  DuesPaymentNotifier.created(@dues_payment).deliver

  respond_to do |format|
    format.html { redirect_to member_path(@dues_payment.member_id), :notice => 'Dues Reminder was emailed.' }
  end

end


end
