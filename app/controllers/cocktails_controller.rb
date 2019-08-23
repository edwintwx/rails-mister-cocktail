class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.new
  end

  def edit
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)

    redirect_to cocktail_path(@cocktail)
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    if @cocktail.save
      @ingredient = Ingredient.find_by(name: params[:cocktail][:ingredients])
      @dose = Dose.create(description: params[:cocktail][:doses])
      @dose.cocktail = @cocktail
      @dose.ingredient = @ingredient
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
    else
        render :new
    end
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
    # params.require(:dose).permit(:doses, :ingredients)
  end
end
