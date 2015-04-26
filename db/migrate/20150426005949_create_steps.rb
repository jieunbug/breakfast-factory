class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :description
      t.boolean :active
      t.integer :order_in_recipe
      t.integer :recipe_id

      t.timestamps null: false
    end
  end
end
