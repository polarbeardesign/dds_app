class TestAnswer < ActiveRecord::Base
  belongs_to :test_question
  has_many :test_submission_responses

  scope :ordered, order('answer_letter')


end
