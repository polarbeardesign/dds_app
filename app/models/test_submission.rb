class TestSubmission < ActiveRecord::Base
  belongs_to :knowledge_test
  belongs_to :member
  has_many :test_submission_responses, :dependent => :destroy
  accepts_nested_attributes_for :test_submission_responses

end
