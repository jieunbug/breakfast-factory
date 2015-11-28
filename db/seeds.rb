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
             order_in_recipe: 1,
             time: 3

Step.create  recipe_id: 1,
             description: 'Let oven preheat to 425°F.',
             active: false,
             order_in_recipe: 2,
             time: 10

Step.create  recipe_id: 1,
             description: 'Season salmon with 1 teaspoon oil, plus salt and pepper.',
             active: true,
             order_in_recipe: 3,
             time: 2

Step.create  recipe_id: 1,
             description: 'Roast until fish is just cooked through, about 12 minutes.',
             active: false,
             order_in_recipe: 4,
             time: 12

Step.create  recipe_id: 1,
             description: 'Cut salmon in half crosswise, then lift flesh from skin with a metal spatula and transfer to a plate.',
             active: true,
             order_in_recipe: 5,
             time: 3

Step.create  recipe_id: 1,
             description: 'Discard skin, then drizzle salmon with oil and sprinkle with herbs.',
             active: true,
             order_in_recipe: 6,
             time: 3

Step.create  recipe_id: 2,
             description: 'Finely chop rosemary leaves.',
             active: true,
             order_in_recipe: 1,
             time: 3

Step.create  recipe_id: 2,
             description: 'Bring a 6-quart saucepan of salted water to a boil.',
             active: false,
             order_in_recipe: 2,
             time: 20

Step.create  recipe_id: 2,
             description: 'Let orzo cook until tender.',
             active: false,
             order_in_recipe: 3,
             time: 10

Step.create  recipe_id: 2,
             description: 'Drain orzo well.',
             active: true,
             order_in_recipe: 4,
             time: 1

Step.create  recipe_id: 2,
             description: 'In a large bowl, toss with oil, rosemary, and salt and pepper to taste.',
             active: true,
             order_in_recipe: 5,
             time: 3

puts 'Done!'