class KnowledgeTest < ActiveRecord::Base

  has_many :test_questions, :dependent => :destroy
#  has_many :test_submissions
  accepts_nested_attributes_for :test_questions, :reject_if => lambda { |a| a[:question].blank? }, :allow_destroy => true

end
