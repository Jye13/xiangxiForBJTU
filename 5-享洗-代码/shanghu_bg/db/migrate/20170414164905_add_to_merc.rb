class AddToMerc < ActiveRecord::Migration[5.0]
  def change
    add_column :merchants, :comment, :string
    add_column :merchants, :logo, :string
    add_column :merchants, :card, :string
    add_column :merchants, :rename, :string
    add_column :merchants, :sex, :string
  end
end
