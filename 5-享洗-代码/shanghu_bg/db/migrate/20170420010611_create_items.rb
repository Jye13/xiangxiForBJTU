class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.decimal :price
      t.integer :amount
      t.integer :product_id
      t.integer :user_id
      t.integer :order_id

      t.timestamps
    end
  end
end
