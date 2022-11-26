class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer   :user_id
      t.string    :recipe_name
      t.text      :trick
      t.text      :recipe_introduction
      t.integer   :price
      t.integer   :time
      t.integer   :people
      t.timestamps
    end
  end
end
