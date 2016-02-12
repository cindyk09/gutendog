class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @pending_friends = current_user.pending_friends
    @friends = current_user.real_friends
    if params[:search].present?
      @users = User.near(current_user, params[:search])
      @users = @users.select{|user| user != current_user}
   else
      @users = []
   end
   respond_to do |format|
     format.html {}
     format.js {}
   end
 end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
