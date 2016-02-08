class FriendshipsController < ApplicationController
  def create
    new_friend = User.find(params['friend_id'])
    friendship = Friendship.new(friend_id: new_friend, user_id: current_user.id)
    if friendship.save
      notif = Notification.new(friend_requester: current_user, recipient: new_friend)
      notif.message = notif.friend_request
      notif.save

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

  def index
    @pending_friends = current_user.pending_friends
    @users = current_user.real_friends
  end

  def update
  end
end
