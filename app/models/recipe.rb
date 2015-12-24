class Recipe < ActiveRecord::Base
	belongs_to :meal
	has_many :steps
	accepts_nested_attributes_for :steps, :reject_if => :all_blank, allow_destroy: true
	validates :name, presence: true

	# Need to figure out what to do about steps with zero time specified 
	def self.nyt_import(url)
		require 'open-uri'
		page = Nokogiri::HTML(open(url))
		steps_array = page.css('ol.recipe-steps li')
		
		recipe_title = page.css('h1.recipe-title').text.strip
		recipe = Recipe.create(name: recipe_title)
		
		step_number = 0 
		ingredients_array = page.css('ul.recipe-ingredients li')
		ingredients_array.each do |ingredient|
			text = ingredient.text.strip
			if ingredient_prep_required?(text)
				recipe.steps.create(order_in_recipe: step_number, active: true, time: 4, description: "Prepare " + text) 
				step_number += 1
			end  
		end 
		steps_array.each do |step|
			time = recipe.find_step_time(step.text)
			recipe.steps.create(order_in_recipe: step_number, active: false, time: time, description: step.text)
			step_number += 1
		end 
		
		recipe 
	end 

	def find_step_time(step_text)
		index = step_text.index("minutes")
		if index 
			minutes_text = step_text[index-9..index+7]
			step_time = minutes_text[/\d+/].to_i 
		else 
			0
		end 
	end 

	def self.ingredient_prep_required?(ingredient_text)
		active_words = ["chopped", "sliced", "diced", "peeled", "minced", "cleaned", "grated", "mashed", "smashed", "juiced", "quartered"]
		if active_words.any? { |word| ingredient_text.include?(word) }
			return true 
		else 
			return false 
		end 

	end 
end
