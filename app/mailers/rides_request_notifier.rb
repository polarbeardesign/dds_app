class RidesRequestNotifier < ActionMailer::Base
  default :from => "info@devildogsquadron.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rides_request_notifier.created.subject
  #
  def created(ride_request)
    @ride_request = ride_request

      if Rails.env.production?
        mail :to => @ride_request.email, 
             :cc => 'info@devildogsquadron.com', 
             :subject => 'Ride Request Received'
      else
        mail :to => @ride_request.email, 
             :subject => 'Ride Request Received'
      end
  end
end
