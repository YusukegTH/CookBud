class Preference < ApplicationRecord
  # Associations
  belongs_to :user

  # Validates
  validates :user_id, presence: true, uniqueness: true
  validates :appliances, presence: true
  validates :inventory, presence: true
  validates :diet, presence: true
  validates :allergies, presence: true
  validates :level, presence: true
end
