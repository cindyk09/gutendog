class WalksController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    request = Request.find(params['request_id'])
    walk = Walk.new(walker: current_user, request: request)
    walk.pets = request.owner.pets

    if walk.save

      notif = Notification.new(walk: @walk, recipient: @walk.request.owner)
      notif.message = notif.request_accepted
      notif.save
      
      redirect_to user_path(request.owner)
    else
      redirect_to user_path(request.owner)
    end
  end

  def delete
  end

  def edit
  end

  def show
    @walk = Walk.find(params['id'])
  end

  def update
    @walk = Walk.find(params['id'])
    @walk.completed = true
    if @walk.save

      notif = Notification.new(walk: @walk, recipient: @walk.request.owner)
      notif.message = notif.dog_walked
      notif.save

      respond_to do |format|
        format.html { redirect_to root_path }
        format.js {  }
      end

    end
  end
end
