class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string    :recipe_name
      t.string    :food
      t.text      :trick
      t.text      :recipe_introduction
      t.integer   :price
      t.integer   :time
      t.integer   :people
      t.integer   :user_id
      t.timestamps
    end
  end
end
