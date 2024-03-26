class Bookmark < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :recipe

  # Validations
  validates :user_id, presence: true
  validates :recipe_id, presence: true
  validates :user_id, uniqueness: { scope: :recipe_id, message: "has already bookmarked this recipe" }
end
