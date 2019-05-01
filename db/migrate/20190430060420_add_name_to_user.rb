class AddNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :surname, :string
    add_column :users, :gender, :integer
    add_column :users, :date_of_birth, :date
    add_column :users, :university, :string
  end
end
