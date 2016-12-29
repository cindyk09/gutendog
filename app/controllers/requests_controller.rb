class RequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    binding.pry
    @requests = Request.active_requests.select{|request| current_user.friend_of(request.owner)}
    respond_to do |format|
      format.html {}
      format.json {render json: current_user.request_and_walks_for_json}
    end
  end

  def new
    @request = Request.new(start_time: DateTime.now, end_time: DateTime.now)
  end

  def create
    @request = Request.new(request_params)
    @request.owner = current_user

    if @request.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js {}
      end
    else
      render :new
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def edit
  end

  def destroy
    @request = Request.find(params['id'])
    if @request.walk
      notif = Notification.new(walk: @request.walk, recipient: @request.walk.walker)
      notif.message = notif.request_cancellation
      notif.walk_id = nil
      notif.save
    end

    @request.destroy

    respond_to do |format|
      format.html { render 'requests/destroy.js.erb' }
      format.js { render 'requests/destroy.js.erb' }
    end
  end

  private

  def request_params
    params.require(:request).permit(:start_time, :end_time, :pickup)
  end
end
