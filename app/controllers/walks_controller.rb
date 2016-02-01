class WalksController < ApplicationController
  def new
  end

  def create
    request = Request.find(params['request_id'])
    walk = Walk.new(walker: current_user, request: request)
    walk.pets = request.owner.pets

    if walk.save #&& request is deleted
      redirect_to root_path
    else
      redirect_to user_path(request.owner)#'users/#{Request.find(params['request_id']).owner.id}'
    end
  end

  def show
  end

  def delete
  end

  def edit
  end

  def update
  end
end
