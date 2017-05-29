class CreateMerchantProductships < ActiveRecord::Migration[5.0]
  def change
    create_table :merchant_productships do |t|
      t.integer :merchant_id
      t.integer :product_id

      t.timestamps
    end
  end
end
