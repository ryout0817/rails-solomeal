class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string    :recipe_name
      t.string    :food
      t.string    :main_food
      t.text      :material
      t.text      :recipe_how
      t.integer   :price
      t.integer   :time
      t.integer   :people
      t.integer   :user_id
      t.timestamps
    end
  end
end
