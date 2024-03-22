class Recipe < ApplicationRecord
  # Associations
  has_one_attached :photo
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

  def self.filter_with_preference(preference)
    filtered_results = []
    if preference[:level] == "beginner"
      search_results = Recipe.where(difficulty: "beginner")
    elsif preference[:level] == "intermediate"
      search_results = Recipe.where(difficulty: ["beginner", "intermediate"])
    else
      search_results = Recipe.all
    end

    search_results = search_results.where("duration <= ?", preference[:duration].to_i)

    search_results.each do |recipe|
      if check_appliances? && check_ingredients? && check_diet? && check_allergies?
        filtered_results << recipe
      end
    end
    filtered_results
  end

  private

  def contained_in_list?(list_to_check, list_to_check_against)
    # Check if list_to_check is contained in list_to_check_against
    (list_to_check & list_to_check_against) == list_to_check
  end

  def check_appliances?
    contained_in_list?(recipe.appliances, preference[:appliances])
  end

  def check_ingredients?
    contained_in_list?(recipe.ingredients, preference[:ingredients])
  end

  def check_diet?
    contained_in_list?(recipe.diet, preference[:diet])
  end

  def check_allergies?
    !contained_in_list?(preference[:allergies], recipe.ingredients)
  end

end
