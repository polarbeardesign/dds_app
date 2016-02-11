class TripInfoNotifier < ActionMailer::Base
  default :from => "info@devildogsquadron.com"

  def created(trip)
    @trip = trip

    email_addresses = ""

    @trip.event.event_signups.each do |event_signup|
      if email_addresses == ""
        email_addresses = email_addresses + event_signup.member.user.email
      else
        email_addresses = email_addresses + "," + event_signup.member.user.email
      end
    end

      mail :to => email_addresses,
           :cc => 'info@devildogsquadron.com', 
           :subject => 'Devil Dog Trip Info: ' + @trip.event.title
  
  end

  def change(trip)
    @trip = trip

    email_addresses = ""

    @trip.event.event_signups.each do |event_signup|
      if email_addresses == ""
        email_addresses = email_addresses + event_signup.member.user.email
      else
        email_addresses = email_addresses + "," + event_signup.member.user.email
      end
    end

      mail :to => email_addresses,
           :cc => 'info@devildogsquadron.com', 
           :subject => 'Devil Dog Trip Update: ' + @trip.event.title
  
  end

end
