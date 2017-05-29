class RemoteMerId < ActiveRecord::Migration[5.0]
  def change
    remove_column :stations, :merchant_id
  end
end
