class AddFriendRequesterToNotifications < ActiveRecord::Migration
  def change
    add_reference :notifications, :friend_requester, index: true
  end
end
