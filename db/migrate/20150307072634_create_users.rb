class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email, null: false
      t.text :password, null: false
      t.text :password_confirmation, null: false

      t.boolean :is_admin, default: false, null: false
    end
  end
end
