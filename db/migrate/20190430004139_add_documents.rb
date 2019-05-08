class AddDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :doc_type, :integer
  end
end
