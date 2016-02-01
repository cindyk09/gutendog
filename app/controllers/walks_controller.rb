class WalksController < ApplicationController
  def new
  end

  def create
    request = Request.find(params['request_id'])
    walk = Walk.new(walker: current_user, request: request)
    walk.pets = request.owner.pets

    if walk.save
      redirect_to user_path(request.owner)
    else
      redirect_to user_path(request.owner)
    end
  end

  def delete
  end

  def edit
  end

  def update
    walk = Walk.find(params['id'])
    walk.completed = true
    walk.save
    #flash message
    redirect_to root_path
  end
end
