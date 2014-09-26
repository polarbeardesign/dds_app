class RidesRequestNotifier < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rides_request_notifier.created.subject
  #
  def created(ride_request)
    @ride_request = ride_request

    mail :to => @ride_request.email, :cc => 'shanghaibiker@gmail.com', :subject => 'Sign Up Receieved'
    
  end
end
