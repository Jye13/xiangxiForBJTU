class AddWithdrawToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :withdraw, :integer, :null => false, :default => 1
  end
end
