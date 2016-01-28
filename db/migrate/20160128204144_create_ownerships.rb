class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.references :pet, index: true, foreign_key: true
      t.references :owner, index: true

      t.timestamps null: false
    end
    add_foreign_key :ownerships, :users, column: :owner_id
  end
end
