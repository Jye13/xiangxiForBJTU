class AddMerchantPriceToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :merchant_price, :decimal
  end
end
