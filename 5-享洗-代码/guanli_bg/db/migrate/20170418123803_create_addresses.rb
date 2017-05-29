class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.string :comment

      t.timestamps
    end
  end
end
