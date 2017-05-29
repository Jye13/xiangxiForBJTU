class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :name
      t.integer :user_id
      t.date :from
      t.date :to
      t.decimal :price
      t.decimal :discount
      t.integer :is_del, :null => false, :default => 0

      t.timestamps
    end
  end
end
