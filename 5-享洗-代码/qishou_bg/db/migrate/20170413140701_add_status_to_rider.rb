class AddStatusToRider < ActiveRecord::Migration[5.0]
  def change
    add_column :riders, :status, :integer, :null => false, :default => 1
  end
end
