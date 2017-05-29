class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :logo
      t.integer :is_delete, :default => 0, :null => false

      t.timestamps
    end
  end
end
