class CreateTestSubmissionResponses < ActiveRecord::Migration
  def change
    create_table :test_submission_responses do |t|
      t.references :test_submission
      t.references :test_question
      t.references :test_answer

      t.timestamps
    end
    add_index :test_submission_responses, :test_submission_id
    add_index :test_submission_responses, :test_question_id
    add_index :test_submission_responses, :test_answer_id
  end
end
