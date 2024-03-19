class ChangeRecipeColumns < ActiveRecord::Migration[7.1]
  def change
    change_column :recipes, :description, :string
    change_column :recipes, :ingredients, :string
    change_column :recipes, :appliances, :string
    change_column :recipes, :instructions, :string
    change_column :recipes, :diet, :string
  end
end
