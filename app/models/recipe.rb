class Recipe < ActiveRecord::Base
	belongs_to :meal
	has_many :steps
	accepts_nested_attributes_for :steps, allow_destroy: true
end
