class MembershipAddedNotifier < ActionMailer::Base
  default :from => "jim.ivanoff@devildogsquadron.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.roster_notifier.created.subject
  #
  def created(member)
    @member = member
    attachments['Members_Login_Instructions.pdf'] = File.read('public/uploads/docs/Members_Login_Instructions.pdf')
    attachments['Online_Air_Show_Trip_Signups.pdf'] = File.read('public/uploads/docs/Online_Air_Show_Trip_Signups.pdf')
    attachments['Calendar_Feed_Instructions.pdf'] = File.read('public/uploads/docs/Calendar_Feed_Instructions.pdf')

      if Rails.env.production?
        mail :to => member.user.email, 
             :cc => 'jim.ivanoff@devildogsquadron.com,earnie.henderson@gmail.com', 
             :subject => 'Welcome! Devil Dog Squadron Website Login'
      else
        mail :to => member.user.email, 
             :subject => 'Welcome! Devil Dog Squadron Website Login'
      end
  end

end