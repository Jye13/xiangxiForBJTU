class CreateMerchantStationships < ActiveRecord::Migration[5.0]
  def change
    create_table :merchant_stationships do |t|
      t.integer :merchant_id
      t.integer :station_id

      t.timestamps
    end
  end
end
