class CreateMerchantOrderships < ActiveRecord::Migration[5.0]
  def change
    create_table :merchant_orderships do |t|
      t.integer :merchant_id
      t.integer :order_id

      t.timestamps
    end
  end
end
