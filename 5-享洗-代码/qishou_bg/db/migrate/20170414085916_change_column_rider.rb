class ChangeColumnRider < ActiveRecord::Migration[5.0]
  def change
    remove_column :riders, :license
    add_column :riders, :id_front, :string
    add_column :riders, :id_back, :string
  end
end
