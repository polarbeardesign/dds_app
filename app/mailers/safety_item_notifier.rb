class SafetyItemNotifier < ActionMailer::Base
  default :from => "safety_alert@devildogsquadron.com"

  def created(safety_item)
    @safety_item = safety_item


        mail :to => 'jim@polarbeardesign.net', 
             :subject => 'Safety Item Alert: ' + @safety_item.subject
      end
  end
end
