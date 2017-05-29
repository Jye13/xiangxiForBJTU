class CreateMerchantIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :merchant_incomes do |t|
      t.integer :merchant_id
      t.decimal :price
      t.decimal :discount
      t.integer :order_id

      t.timestamps
    end
  end
end
