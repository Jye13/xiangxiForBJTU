class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.integer :user_card_id
      t.decimal :real_money
      t.decimal :fake_money
      t.string :type
      t.integer :status

      t.timestamps
    end
  end
end
