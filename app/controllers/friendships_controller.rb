class FriendshipsController < ApplicationController
  def create
    friendship = Friendship.new(friend_id: params["friend_id"], user_id: current_user.id)
      if friendship.save
      # Notification
        respond_to do |format|
          format.html { redirect_to user_path(current_user) }
          format.js { }
        end
      else
      respond_to do |format|
          format.html { redirect_to user_path(current_user) }
          format.js { render 'friendships/fail' }
        end
      end
  end

  def update
  end
end
