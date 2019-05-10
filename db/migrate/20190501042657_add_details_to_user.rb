class AddDetailsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :surname, :string
    add_column :users, :username, :string
    add_column :users, :birthday, :date
    add_column :users, :school, :string
    add_column :users, :gender, :integer
    add_column :users, :admin, :boolean, default: false
    add_column :users, :stripe_transaction, :string, default: "unpaid"
  end
end
