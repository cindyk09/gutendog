class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :recipient, index: true
      t.boolean :viewed
      t.boolean :clicked
      t.references :walk, index: true, foreign_key: true
      t.references :request, index: true, foreign_key: true
      t.string :message

      t.timestamps null: false
    end
  end
end
