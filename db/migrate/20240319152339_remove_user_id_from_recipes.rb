class RemoveUserIdFromRecipes < ActiveRecord::Migration[7.1]
  def change
    remove_column :recipes, :user_id, :integer
  end
end
