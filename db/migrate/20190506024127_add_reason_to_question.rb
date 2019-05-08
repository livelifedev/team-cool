class AddReasonToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :reason, :integer
  end
end
