class RemoveDocuments < ActiveRecord::Migration[5.2]
  def change
    remove_column :documents, :type, :integer
  end
end
