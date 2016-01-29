class ChangeEndToRequests < ActiveRecord::Migration
  def change
    rename_column :requests, :end, :end_time
    rename_column :requests, :start, :start_time
  end
end
