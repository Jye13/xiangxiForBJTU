class CreateMerchantLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :merchant_logs do |t|
      t.decimal :money
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
