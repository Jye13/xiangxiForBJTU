class CreateMerchantCategoryships < ActiveRecord::Migration[5.0]
  def change
    create_table :merchant_categoryships do |t|
      t.integer :merchant_id
      t.integer :category_id

      t.timestamps
    end
  end
end
