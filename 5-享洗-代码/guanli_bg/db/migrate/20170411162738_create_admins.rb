class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :nick
      t.string :password_digest
      t.integer :is_del, :default => 0, :null => false

      t.timestamps
    end
  end
end
