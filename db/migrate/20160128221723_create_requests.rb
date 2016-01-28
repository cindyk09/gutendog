class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.datetime :start
      t.datetime :end
      t.boolean :pickup
      t.references :owner, index: true

      t.timestamps null: false
    end
    add_foreign_key :requests, :users, column: :owner_id
  end
end
