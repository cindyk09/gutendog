class PetsController < ApplicationController
  before_action :authenticate_user!
  before_action :search_pet, only: [:edit, :show, :update, :destroy]

  def index
    @pets = current_user.pets
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.owners << current_user
    if @pet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @pet = current_user.pets.find(params[:id])
  end

  def edit
    # @pet = Pet.find(params[:id])
  end

  def update
    # @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to @pet
  end

  # def destroy
  # @pet.destroy
  #   respond_to do |format|
  #     # confirm this redirect works
  #     format.html {user_path(current_user)}
  #     format.js { }
  #   end
  # end

  private
  def search_pet
    @pet = current_user.pets.find(params[:id])
    # @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :description, :image, :remote_image_url)
  end
end
