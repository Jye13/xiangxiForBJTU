class RemoveAdminIdFromRole < ActiveRecord::Migration[5.0]
  def change
    remove_column :roles, :admin_id
    add_column :admins, :role_id, :integer
  end
end
