class AddStripeIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :stripe_transaction, :string
  end
end
