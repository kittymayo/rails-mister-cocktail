class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to new_cocktail_dose_path(@dose.cocktail)
    else
      render :new
    end
  end

  def update
    @dose = Dose.find(params[:id])
    @dose.update
  end

  def destroy
    @dose = Dose.find(params[:id])
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
    params.require(:dose).permit(:description, :cocktail_id)
  end
end
