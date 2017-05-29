class CreateFunctions < ActiveRecord::Migration[5.0]
  def change
    create_table :functions do |t|
      t.string :name
      t.string :index

      t.timestamps
    end
  end
end
