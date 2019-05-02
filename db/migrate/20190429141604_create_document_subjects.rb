class CreateDocumentSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :document_subjects do |t|
      add_reference :document_subjects, :document, foreign_key: true
      add_reference :document_subjects, :subject, foreign_key: true
    end
  end
end
