class CreateRoleAuthorityships < ActiveRecord::Migration[5.0]
  def change
    create_table :role_authorityships do |t|
      t.integer :role_id
      t.integer :authority_id

      t.timestamps
    end
  end
end
