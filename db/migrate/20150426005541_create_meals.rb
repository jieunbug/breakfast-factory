class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.text :name
      t.integer :recipe01
      t.integer :recipe02

      t.timestamps null: false
    end
  end
end
