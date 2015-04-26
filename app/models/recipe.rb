class Recipe < ActiveRecord::Base
	belongs_to :meal
	has_many :steps
end
