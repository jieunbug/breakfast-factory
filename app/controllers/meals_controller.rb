class MealsController < ApplicationController
	def index
		@meals = Meal.all
	end
	
	def new
		@meal = Meal.new
	end

	def create
		@meal = Meal.new(meal_params)

		if @meal.save
			redirect_to @meal
		else
			render :new
		end
	end

	def show

		@meal = Meal.find(params[:id])
		
		first = Step.all.select { |step| step.recipe_id == @meal.recipe01 }

		second = Step.all.select { |step| step.recipe_id == @meal.recipe02 }

		a = first.collect { |step| [step.id, step.active, step.description, Recipe.find(step.recipe_id).name] }
		b = second.collect { |step| [step.id, step.active, step.description, Recipe.find(step.recipe_id).name] }

		a_copy = a.clone
		b_copy = b.clone

		merged_array = []

		until a_copy.empty?
			step = a_copy.shift
			if step[1] == true
		    	merged_array << step
		    else
		    	merged_array << step
		    	loop do
		        	break if b_copy.empty?
		        	b_step = b_copy.shift
		        	if b_step[1] == true
		          	merged_array << b_step
		        	else
		          	merged_array << b_step
		          	break
		        	end
		      	end
		    end
		end
		@list = merged_array
	end
end

private
  def meal_params
    params.require(:meal).permit(:name, :recipe01, :recipe02)
  end
