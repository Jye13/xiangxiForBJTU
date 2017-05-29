class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :nick
      t.integer :is_del, :default => 0, :null => false
      t.integer :admin_id
      t.text :comment, :null => false

      t.timestamps
    end
  end
end
