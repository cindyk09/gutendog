class PetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @pets = Pet.all #later to be current_user friends pet's
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.owners << current_user
    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to @pet
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :description)
  end
end
