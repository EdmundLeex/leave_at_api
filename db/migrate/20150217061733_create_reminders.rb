class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.text :origin
      t.text :destination
      t.text :email
      t.text :repeat

      t.datetime :arrival_time
      t.boolean :is_finished, default: false, null: false

      t.timestamps
    end

    add_index :reminders, :is_finished
    add_index :reminders, :arrival_time
  end
end
