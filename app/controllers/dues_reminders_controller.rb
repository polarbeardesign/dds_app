class DuesRemindersController < ApplicationController
  before_filter :set_dues_reminder, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @dues_reminders = DuesReminder.all
    respond_with(@dues_reminders)
  end

  def show
    respond_with(@dues_reminder)
  end

  def new
    @dues_reminder = DuesReminder.new
    respond_with(@dues_reminder)
  end

  def edit
  end

  def create
    @dues_reminder = DuesReminder.new(params[:dues_reminder])
    @dues_reminder.save
    respond_with(@dues_reminder)
  end

  def update
    @dues_reminder.update_attributes(params[:dues_reminder])
    respond_with(@dues_reminder)
  end

  def destroy
    @dues_reminder.destroy
    respond_with(@dues_reminder)
  end

  private
    def set_dues_reminder
      @dues_reminder = DuesReminder.find(params[:id])
    end
end
