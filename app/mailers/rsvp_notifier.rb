class RsvpNotifier < ActionMailer::Base
  default :from => "info@devildogsquadron.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rsvp_notifier.created.subject
  #
  def created(attendance)
    @attendance = attendance

      if Rails.env.production?
        mail :to => attendance.member.user.email, 
             :cc => 'info@devildogsquadron.com', 
             :subject => attendance.event.title + ' RSVP Received'
      else
         mail :to => attendance.member.user.email,  
             :subject => attendance.event.title + ' RSVP Received' 
      end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.roster_notifier.change.subject
  #
  def change(attendance)
    @attendance = attendance

      if Rails.env.production?
        mail :to => attendance.member.user.email, 
             :cc => 'info@devildogsquadron.com', 
             :subject => attendance.event.title + ' RSVP Change Received'
      else
         mail :to => attendance.member.user.email,  
             :subject => attendance.event.title + ' RSVP Change Received' 
      end
  end
end