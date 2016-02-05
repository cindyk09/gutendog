class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.select { |user| user != current_user  }
    if params[:search].present?
      binding.pry
     @user = User.near(params[:search], 1, :order => :distance)

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
