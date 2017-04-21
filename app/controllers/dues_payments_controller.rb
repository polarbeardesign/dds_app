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


def dues_reminder

  @dues_payment = DuesPayment.find(params[:id])
  DuesPaymentNotifier.created(@dues_payment).deliver

  respond_to do |format|
    format.html { redirect_to @dues_payment, :notice => 'Dues Reminder was emailed.' }
  end

end


end
