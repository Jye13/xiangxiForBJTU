class CreateMerchants < ActiveRecord::Migration[5.0]
  def change
    create_table :merchants do |t|
      t.string :nick
      t.string :password_digest
      t.integer :mobile
      t.string :mail

      t.timestamps
    end
  end
end
