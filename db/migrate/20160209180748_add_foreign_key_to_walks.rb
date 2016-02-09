class AddForeignKeyToWalks < ActiveRecord::Migration
  def change
    remove_column :walks, :request_id
    add_column :walks, :request_id, :integer, index: true
    add_foreign_key :walks, :requests, column: :request_id, on_delete: :cascade
  end
end
