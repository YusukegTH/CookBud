class Review < ApplicationRecord
  # Associations
  belongs_to :recipe
  belongs_to :user

  # Validations
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment, presence: true
end
