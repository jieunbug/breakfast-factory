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
		steps_array.each_with_index do |step, index|
			time = recipe.find_step_time(step.text)
			new_step = recipe.steps.create(order_in_recipe: index+1, active: true, time: time, description: step.text)
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
end
