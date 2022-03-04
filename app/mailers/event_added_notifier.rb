class EventAddedNotifier < ActionMailer::Base
  default :from => "info@devildogsquadron.com"

  def created(event)
    @event = event

      if Rails.env.production?
        mail :to => 'jim@polarbeardesign.net', 
           :subject => 'Devil Dog Trip Info: ' + @event.title
      else
        mail :to => 'jim@polarbeardesign.net', 
             :subject => 'Devil Dog Trip Info: ' + @event.title
      end  
  end

end
