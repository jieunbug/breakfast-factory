class RecipesController < ApplicationController
  def index
  	@recipes = Recipe.all
  end

  def show
  	@recipe = Recipe.find(params[:id])
  	@steps = @recipe.steps
  end

  def list
    @recipe = Recipe.find(params[:id])
    @steps = @recipe.steps
  end  
  
  def new
  	@recipe = Recipe.new

  end

  def create
	@recipe = Recipe.new(recipe_params)
		#conditional to prevent saving non-unique order_in_recipe for a step - throw them in an array and check for dupes
    if @recipe.save
			redirect_to @recipe
		else
			render :new
		end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end


end

private
  def recipe_params
    params.require(:recipe).permit(:name, steps_attributes: [:id, :description, :active, :recipe_id, :order_in_recipe, :time, :_destroy])
  end