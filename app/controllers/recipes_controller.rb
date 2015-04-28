class RecipesController < ApplicationController
  def index
  	@recipes = Recipe.all
  end

  def show
  	@recipe = Recipe.find(params[:id])
  	@steps = @recipe.steps
  end

  def new
  	@recipe = Recipe.new

  end

  def create
	@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to @recipe
		else
			render :new
		end
  end

end

private
  def recipe_params
    params.require(:recipe).permit(:name, steps_attributes: [:id, :description, :active, :recipe_id, :order_in_recipe, :_destroy])
  end