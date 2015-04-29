class Recipe < ActiveRecord::Base
	belongs_to :meal
	has_many :steps
	accepts_nested_attributes_for :steps, :reject_if => :all_blank, allow_destroy: true
	validates :name, presence: true

end
