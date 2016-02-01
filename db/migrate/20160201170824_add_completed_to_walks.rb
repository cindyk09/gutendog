class AddCompletedToWalks < ActiveRecord::Migration
  def change
    add_column :walks, :completed, :boolean, :default => false
  end
end
