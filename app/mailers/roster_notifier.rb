class RosterNotifier < ActionMailer::Base
  default :from => "info@devildogsquadron.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.roster_notifier.created.subject
  #
  def created(event_signup)
    @event_signup = event_signup

      if Rails.env.production?
        mail :to => event_signup.member.user.email, 
             :cc => 'info@devildogsquadron.com', 
             :subject => event_signup.event.title + ' Sign Up Received'
      else
        mail :to => event_signup.member.user.email, 
             :subject => event_signup.event.title + ' Sign Up Received'
      end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.roster_notifier.change.subject
  #
  def change(event_signup)
    @event_signup = event_signup

      if Rails.env.production?
        mail :to => event_signup.member.user.email, 
             :cc => 'info@devildogsquadron.com', 
             :subject => event_signup.event.title + ' Sign Up Change Received'
      else
        mail :to => event_signup.member.user.email, 
             :subject => event_signup.event.title + ' Sign Up Change Received'
      end

  end
end
