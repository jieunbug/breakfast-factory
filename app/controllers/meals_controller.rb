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

		if first.count > second.count
			a = first.collect { |step| [step.active, step.id, step.description, Recipe.find(step.recipe_id).name] }
			b = second.collect { |step| [step.active, step.id, step.description, Recipe.find(step.recipe_id).name] }
		else
			b = first.collect { |step| [step.active, step.id, step.description, Recipe.find(step.recipe_id).name] }
			a = second.collect { |step| [step.active, step.id, step.description, Recipe.find(step.recipe_id).name] }
		end

		merged_array = []

	    until a.empty?
			step = a.shift
				if step[0] == true
			    	merged_array << step
			    else
			    	merged_array << step
			    	loop do
			        	break if b.empty?
			        	b_step = b.shift
			        	if b_step[0] == true
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


  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to meals_path
  end

end

private
  def meal_params
    params.require(:meal).permit(:name, :recipe01, :recipe02)
  end
