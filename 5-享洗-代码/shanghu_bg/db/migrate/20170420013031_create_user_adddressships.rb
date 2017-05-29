class CreateUserAdddressships < ActiveRecord::Migration[5.0]
  def change
    create_table :user_adddressships do |t|
      t.integer :user_id
      t.integer :address_id

      t.timestamps
    end
  end
end
