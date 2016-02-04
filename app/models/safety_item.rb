class SafetyItem < ActiveRecord::Base

  has_paper_trail :class_name => 'SafetyItemVersion',
      :meta => { :author_username => :user_name}

end
