class TestQuestion < ActiveRecord::Base
  belongs_to :knowledge_test
#  has_many :test_submission_responses
  has_many :test_answers, :dependent => :destroy
  accepts_nested_attributes_for :test_answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  scope :ordered, order('question_no ASC')


end
