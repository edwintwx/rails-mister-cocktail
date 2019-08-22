class DoseController < ApplicationController
  def index
    @doses = Dose.all
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.create(dose_params)
    @ingredient = Ingredient.find_by(name: params[:ingredient])
  end

  private

  def dose_params
    params.require(:dose).permit(:create)
  end
end
