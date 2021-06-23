class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
   10.times {@recipe.ingredients.build}
    
  end

  def create
    @recipe = Recipe.new(recipie_params)
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "Your recipie was created"
    end
  end
  private
  def recipie_params
    params.require(:recipe).permit(:title, 
      ingredients_attributes: [ :quantity, :name])
  end
end