class CreateRiders < ActiveRecord::Migration[5.0]
  def change
    create_table :riders do |t|
      t.string :name
      t.string :password_digest, :null => false
      t.string :mobile, :null => false
      t.string :sex
      t.string :license
      t.string :license_num
      t.integer :is_del, :null => false, :default => 0

      t.timestamps
    end
  end
end
