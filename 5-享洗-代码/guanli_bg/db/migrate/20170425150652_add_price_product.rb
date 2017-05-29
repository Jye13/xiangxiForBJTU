class AddPriceProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price1, :decimal
    add_column :products, :price2, :decimal
    add_column :products, :price3, :decimal
    add_column :products, :price4, :decimal
    add_column :products, :price5, :decimal
    add_column :products, :price6, :decimal
    add_column :merchant_productships, :price, :decimal
  end
end
