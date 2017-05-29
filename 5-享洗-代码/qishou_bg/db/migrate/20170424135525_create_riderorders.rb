class CreateRiderorders < ActiveRecord::Migration[5.0]
  def change
    create_table :riderorders do |t|
      t.string :rider_id
      t.string :order_id
      t.integer :is_del, :null => false, :default => 0
      t.timestamps
    end
  end
end
