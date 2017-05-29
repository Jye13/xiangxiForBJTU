class CreateCategoryPriceships < ActiveRecord::Migration[5.0]
  def change
    create_table :category_priceships do |t|
      t.integer :category_id
      t.integer :price_id

      t.timestamps
    end
  end
end
