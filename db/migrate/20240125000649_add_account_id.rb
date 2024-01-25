class AddAccountId < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :account_id, :integer
  end
end
