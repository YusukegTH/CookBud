class RenameInventoryToIngredients < ActiveRecord::Migration[7.1]
  def change
    rename_column :preferences, :inventory, :ingredients
  end
end
