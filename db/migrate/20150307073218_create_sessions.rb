class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id, null: false
      t.text :token, null: false
      t.datetime :token_expires_at
    end

    add_index :sessions, :token
    add_index :sessions, :user_id
  end
end
