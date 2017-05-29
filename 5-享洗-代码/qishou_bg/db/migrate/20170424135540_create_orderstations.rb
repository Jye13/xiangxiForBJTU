class CreateOrderstations < ActiveRecord::Migration[5.0]
  def change
    create_table :orderstations do |t|
      t.string :station_id
      t.string :order_id
      t.integer :is_del, :null => false, :default => 0
    end
  end
end
