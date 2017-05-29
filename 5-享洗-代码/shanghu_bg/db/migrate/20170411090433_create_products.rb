class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :logo
      t.integer :is_delete, :default => 0, :null => false
      t.integer :category_id

      t.timestamps
    end
  end
end
