class AddDocumentForeignKeyToSubjectDocuments < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :document_subjects, :documents
    add_foreign_key :document_subjects, :subjects
    add_index :document_subjects, :document_id
    add_index :document_subjects, :subject_id
  end
end

