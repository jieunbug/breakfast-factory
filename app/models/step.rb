class Step < ActiveRecord::Base
	belongs_to :recipe
	validates :order_in_recipe, uniqueness: { scope: :recipe_id,
    message: "each order should be unique" }

#note: above validator for :order_in_recipe doesn't actually work!!

end