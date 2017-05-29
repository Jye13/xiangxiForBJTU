class CreateSuggestPriceships < ActiveRecord::Migration[5.0]
  def change
    create_table :suggest_priceships do |t|
      t.integer :merchant_id
      t.integer :product_id
      t.decimal :price

      t.timestamps
    end
  end
end
