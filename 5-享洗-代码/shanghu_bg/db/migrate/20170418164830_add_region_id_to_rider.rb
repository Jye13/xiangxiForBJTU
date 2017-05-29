class AddRegionIdToRider < ActiveRecord::Migration[5.0]
  def change
    add_column :riders, :region_id, :integer
  end
end
