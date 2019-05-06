class AddStripeIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :stripe_transaction, :integer
  end
end
