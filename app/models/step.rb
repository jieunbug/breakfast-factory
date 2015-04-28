class Step < ActiveRecord::Base
	belongs_to :recipe
	validates :order_in_recipe, uniqueness: { scope: :recipe_id,
    message: "need more than one" }
end