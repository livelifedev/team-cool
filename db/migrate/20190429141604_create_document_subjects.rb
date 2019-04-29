class CreateDocumentSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :document_subjects do |t|
      t.integer :document_id
      t.integer :subject_id
    end
  end
end
