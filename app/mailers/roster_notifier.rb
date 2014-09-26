class RosterNotifier < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.roster_notifier.created.subject
  #
  def created(event_signup)
    @event_signup = event_signup

    mail :to => event_signup.member.user.email, :cc => 'shanghaibiker@gmail.com', :subject => 'Sign Up Receieved'

  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.roster_notifier.change.subject
  #
  def change(event_signup)
    @event_signup = event_signup

    mail :to => event_signup.member.user.email, :cc => 'shanghaibiker@gmail.com', :subject => 'Sign Up Change Receieved'

  end
end
