class CreateDocumentSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :document_subjects do |t|
      t.references :document, foreign_key: true
      t.references :subject, foreign_key: true
    end
  end
end
