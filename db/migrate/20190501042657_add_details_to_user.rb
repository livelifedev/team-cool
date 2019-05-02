class AddDetailsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :surname, :string
    add_column :users, :username, :string
    add_column :users, :birthday, :date
  end
end
