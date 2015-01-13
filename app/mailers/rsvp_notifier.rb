class RsvpNotifier < ActionMailer::Base
  default :from => "info@devildogsquadron.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rsvp_notifier.created.subject
  #
  def created(attendance)
    @attendance = attendance

    mail :to => attendance.member.user.email, :cc => 'info@devildogsquadron.com', :subject => attendance.event.title + ' RSVP Received'

  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.roster_notifier.change.subject
  #
  def change(attendance)
    @attendance = attendance

    mail :to => attendance.member.user.email, :cc => 'info@devildogsquadron.com', :subject => attendance.event.title + ' RSVP Change Received'

  end
end