class DosesController < ApplicationController
  # def index
  #   @doses = Dose.all
  # end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:ingredient_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.ingredient = Ingredient.find(params[:ingredient_id])
    if @dose.save
      redirect_to dose_path(@dose)
    else
      render :new
    end
  end

  def update
    @dose = Dose.find(params[:id])
    @dose.update
  end

  def destroy
    @dose.destroy
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def edit
    @dose = Dose.find(params[:id])
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
