# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts 'Adding seed recipes'
Recipe.create name: "Salmon"

Recipe.create name: "Orzo"

puts'Adding seed steps'

Step.create  recipe_id: 1,
             description: 'Chop fresh chives.',
             active: true,
             order_in_recipe: 1

Step.create  recipe_id: 1,
             description: 'Set oven to 425°F.',
             active: true,
             order_in_recipe: 2

Step.create  recipe_id: 1,
             description: 'Let oven preheat.',
             active: false,
             order_in_recipe: 3

Step.create  recipe_id: 1,
             description: 'Rub salmon all over with 1 teaspoon oil and season with salt and pepper.',
             active: true,
             order_in_recipe: 4

Step.create  recipe_id: 1,
             description: 'Place salmon skin side down, on a foil-lined baking sheet in upper third of oven.',
             active: true,
             order_in_recipe: 5

Step.create  recipe_id: 1,
             description: 'Roast until fish is just cooked through, about 12 minutes.',
             active: false,
             order_in_recipe: 6

Step.create  recipe_id: 1,
             description: 'Cut salmon in half crosswise, then lift flesh from skin with a metal spatula and transfer to a plate.',
             active: true,
             order_in_recipe: 7

Step.create  recipe_id: 1,
             description: 'Discard skin, then drizzle salmon with oil and sprinkle with herbs.',
             active: true,
             order_in_recipe: 8

Step.create  recipe_id: 2,
             description: 'Finely chop rosemary leaves.',
             active: true,
             order_in_recipe: 1

Step.create  recipe_id: 2,
             description: 'Bring a 6-quart saucepan of salted water to a boil.',
             active: true,
             order_in_recipe: 2

Step.create  recipe_id: 2,
             description: 'Let the water boil.',
             active: false,
             order_in_recipe: 3

Step.create  recipe_id: 2,
             description: 'Place orzo into water.',
             active: true,
             order_in_recipe: 4

Step.create  recipe_id: 2,
             description: 'Cook orzo until tender, about 10 minutes.',
             active: false,
             order_in_recipe: 5

Step.create  recipe_id: 2,
             description: 'Drain orzo well.',
             active: true,
             order_in_recipe: 6

Step.create  recipe_id: 2,
             description: 'In a large bowl, toss with oil, rosemary, and salt and pepper to taste.',
             active: true,
             order_in_recipe: 7

puts 'Done!'