class Recipe < ApplicationRecord
  # Associations
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :ingredients, presence: true
  validates :appliances, presence: true
  validates :instructions, presence: true
  validates :duration, presence: true
  validates :difficulty, presence: true
  validates :diet, presence: true

end
