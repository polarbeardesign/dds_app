class DuesPaymentNotifier < ActionMailer::Base

if Rails.env.production?
  default :from => "info@devildogsquadron.com"
else
  default :from => "jim@polarbeardesign.net"
end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rides_request_notifier.created.subject
  #
  def created(dues_payment)
    @dues_payment = dues_payment

      if Rails.env.production?
        mail :to => @dues_payment.member.user.email, 
             :cc => 'info@devildogsquadron.com', 
             :subject => 'Devil Dog Squadron Dues Reminder'
      else
        mail :to => "jim@polarbeardesign.net", 
             :subject => 'Devil Dog Squadron Dues Reminder - TEST'
      end
  end
end