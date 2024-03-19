class Bookmark < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :recipe

  # Validations
  validates :user_id, presence: true
  validates :recipe_id, presence: true
end
