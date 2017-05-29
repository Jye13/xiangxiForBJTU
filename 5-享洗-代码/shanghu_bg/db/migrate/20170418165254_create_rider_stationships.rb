class CreateRiderStationships < ActiveRecord::Migration[5.0]
  def change
    create_table :rider_stationships do |t|
      t.integer :rider_id
      t.integer :station_id

      t.timestamps
    end
  end
end
