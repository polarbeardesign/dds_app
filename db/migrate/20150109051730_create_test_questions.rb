class CreateTestQuestions < ActiveRecord::Migration
  def change
    create_table :test_questions do |t|
      t.references :knowledge_test
      t.integer :question_no
      t.text :question

      t.timestamps
    end
    add_index :test_questions, :knowledge_test_id
  end
end
