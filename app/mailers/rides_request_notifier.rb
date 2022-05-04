class RidesRequestNotifier < ActionMailer::Base

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
  def created(ride_request)
    @ride_request = ride_request
    @price = Product.find_by_id(11)

      if Rails.env.production?
        mail :to => @ride_request.email, 
             :cc => 'info@devildogsquadron.com', 
             :subject => 'Ride Request Received'
      else
        mail :to => @ride_request.email, 
             :subject => 'Ride Request Received - TEST'
      end
  end
end
