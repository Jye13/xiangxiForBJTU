class AddRegionToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :region_id, :integer
  end
end
