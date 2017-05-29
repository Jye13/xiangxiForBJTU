class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions do |t|
      t.string :name
      t.integer :parent_id
      t.integer :level

      t.timestamps
    end
  end
end
