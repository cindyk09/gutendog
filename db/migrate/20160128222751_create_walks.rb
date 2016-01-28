class CreateWalks < ActiveRecord::Migration
  def change
    create_table :walks do |t|
      t.references :walker, index: true
      t.references :request, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :walks, :users, column: :walker_id
  end
end
