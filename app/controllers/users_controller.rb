class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :search_user, only: [:edit, :show, :update, :destroy]

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
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  private
  def search_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
