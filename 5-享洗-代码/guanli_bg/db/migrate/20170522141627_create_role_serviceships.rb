class CreateRoleServiceships < ActiveRecord::Migration[5.0]
  def change
    create_table :role_serviceships do |t|
      t.integer :rid
      t.integer :sid

      t.timestamps
    end
  end
end
