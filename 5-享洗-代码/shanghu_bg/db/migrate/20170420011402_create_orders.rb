class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :total_price
      t.integer :status
      t.integer :user_id
      t.integer :address_id
      t.integer :rider_id
      t.integer :merchant_id

      t.timestamps
    end
  end
end
