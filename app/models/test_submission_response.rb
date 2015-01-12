class TestSubmissionResponse < ActiveRecord::Base
  belongs_to :test_submission
  belongs_to :test_question
  belongs_to :test_answer

  scope :this_test, lambda {|query| where(:test_submission_id => query).limit(1) }


end
