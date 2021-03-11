class SafetyItemNotifier < ActionMailer::Base
  default :from => "safety_alert@devildogsquadron.com"

  def created(safety_item)
    @safety_item = safety_item

      if Rails.env.production?
        mail :to => 'safety@devildogsquadron.com', 
             :subject => 'Safety Item Alert: ' + @safety_item.subject
      else
        mail :to => 'jim@polarbeardesign.net', 
             :subject => 'Safety Item Alert: ' + @safety_item.subject
      end
  end
end
