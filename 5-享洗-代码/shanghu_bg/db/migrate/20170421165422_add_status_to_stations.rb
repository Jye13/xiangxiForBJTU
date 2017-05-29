class AddStatusToStations < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :status, :integer, :null => false, :default => 0
  end
end
