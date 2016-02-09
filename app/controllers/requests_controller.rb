class RequestsController < ApplicationController
  before_action :authenticate_user!

  def index
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
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def edit
  end

  private
  def request_params
    params.require(:request).permit(:start_time, :end_time, :pickup)
  end
end
