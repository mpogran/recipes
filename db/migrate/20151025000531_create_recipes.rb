class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :author
      t.text :directions
      t.string :note
      t.string :keywords, array: true
      t.references :user
      t.boolean :is_private, default: true
      t.json :location
      t.json :ingredients
      t.timestamps null: false
    end
  end
end
