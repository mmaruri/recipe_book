class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :category_id
      t.text :directions
      t.integer :user_id

      t.timestamps
    end
  end
end
