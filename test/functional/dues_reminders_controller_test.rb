require 'test_helper'

class DuesRemindersControllerTest < ActionController::TestCase
  setup do
    @dues_reminder = dues_reminders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dues_reminders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dues_reminder" do
    assert_difference('DuesReminder.count') do
      post :create, dues_reminder: { date_sent.date: @dues_reminder.date_sent.date, member.references: @dues_reminder.member.references, notice_name: @dues_reminder.notice_name, sent_to: @dues_reminder.sent_to, text_sent.text: @dues_reminder.text_sent.text }
    end

    assert_redirected_to dues_reminder_path(assigns(:dues_reminder))
  end

  test "should show dues_reminder" do
    get :show, id: @dues_reminder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dues_reminder
    assert_response :success
  end

  test "should update dues_reminder" do
    put :update, id: @dues_reminder, dues_reminder: { date_sent.date: @dues_reminder.date_sent.date, member.references: @dues_reminder.member.references, notice_name: @dues_reminder.notice_name, sent_to: @dues_reminder.sent_to, text_sent.text: @dues_reminder.text_sent.text }
    assert_redirected_to dues_reminder_path(assigns(:dues_reminder))
  end

  test "should destroy dues_reminder" do
    assert_difference('DuesReminder.count', -1) do
      delete :destroy, id: @dues_reminder
    end

    assert_redirected_to dues_reminders_path
  end
end
