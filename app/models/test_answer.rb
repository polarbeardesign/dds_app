class TestAnswer < ActiveRecord::Base
  belongs_to :test_question
  has_many :test_submission_responses
  has_paper_trail

  scope :ordered, order('answer_letter')


end
