class AddIsSettlementToIncomej < ActiveRecord::Migration[5.0]
  def change
    add_column  :merchant_incomes, :is_settlement, :integer, :null => false, :default => 1
  end
end
