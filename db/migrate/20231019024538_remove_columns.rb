class RemoveColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :deal_id
    add_column :groups, :total_deals, :integer
    remove_column :deals, :amount
    add_column :deals, :amount, :integer
  end
end
