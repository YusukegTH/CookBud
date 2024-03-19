class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description, array: true, default: []
      t.text :ingredients, array: true, default: []
      t.text :appliances, array: true, default: []
      t.text :instructions, array: true, default: []
      t.integer :duration
      t.string :difficulty
      t.text :diet, array: true, default: []
      t.string :photo

      t.timestamps
    end
  end
end
