class AddIsDeleteToStation < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :is_del, :integer, :null => false, :default => 0
  end
end
