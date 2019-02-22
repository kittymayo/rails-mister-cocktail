class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def update
    @dose = Dose.find(params[:id])
    @dose.update
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to root_path
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
