class CreateUserCards < ActiveRecord::Migration[5.0]
  def change
    create_table :user_cards do |t|
      t.integer :user_id
      t.decimal :real_money , :default => 0
      t.decimal :fake_money , :default => 100
      t.integer :is_del , :null => false, :default => 0

      t.timestamps
    end
  end
end
