class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :search, :search_results ]

  def home
  end

  def search
    @preference = current_user.preference if user_signed_in?
  end

  def profile
    @user = current_user
    @preference = @user.preference
  end

  def cooking

  end

  def search_results
    @searchAi = searchAi
    # @preference = search_preference
    # @filtered_recipes = Recipe.filter_with_preference(@preference)
  end



  private

  # def search_preference
  #   preference = {}
  #   preference[:appliances] = params[:search][:appliances] if params[:search][:appliances].present?
  #   preference[:ingredients] = params[:search][:ingredients] if params[:search][:ingredients].present?
  #   preference[:diet] = params[:search][:diet] if params[:search][:diet].present?
  #   preference[:allergies] = params[:search][:allergies] if params[:search][:allergies].present?
  #   preference[:level] = params[:search][:level] if params[:search][:level].present?
  #   preference[:duration] = params[:search][:duration] if params[:search][:duration].present?
  #   preference
  # end

  def searchAi
    @content = set_recipe_content
    recipe_string = @content
    recipe_name_match = recipe_string.match(/Name: (.+)(?=Ingredients:)/m)
    @recipe_name = recipe_name_match ? recipe_name_match[1] : "Not specified"
    ingredients_match = recipe_string.match(/Ingredients: (.+)(?=Duration:)/m)
    @ingredients = ingredients_match ? ingredients_match[1] : "Not specified"
    difficulty_match = recipe_string.match(/Difficulty: (.+)(?=Description:)/m)
    @difficulty = difficulty_match ? difficulty_match[1] : "Not specified"
    duration_match = recipe_string.match(/Duration: (\d+)/)
    @duration = duration_match ? duration_match[1] : "Not specified"
    description_match = recipe_string.match(/Description: (.+)/)
    @description = description_match ? description_match[1] : "Not specified"
    instruction_match = recipe_string.match(/Steps:.*/m)
    @instructions = instruction_match ? instruction_match : "Not specified"
    @recipe = Recipe.new(name: @recipe_name, ingredients: @ingredients, appliances: User.last.preference.appliances.join(', '), instructions: @instructions, difficulty: @difficulty, duration: @duration, description: @description, diet: User.last.preference.diet.join(', '))
    @recipe.save!
  end

  def set_recipe_content
    client = OpenAI::Client.new
    test_user1 = User.last
    prompt = "What´s a recipe that uses only #{test_user1.preference.ingredients.join(', ')} and #{test_user1.preference.appliances.join(', ')} to cook. Give me only the name with Name:, the ingredients used in  the recipe, the duration, the difficulty defined as Beginner, Intermediate, Advanced and a Description, followed by the steps you need to cook it without any of your own answer like 'Here is a simple recipe'."
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: prompt}]
    })
    @content = chaptgpt_response["choices"][0]["message"]["content"]
  end

  # def recipe_params
  #   params.require(:recipe).permit(:name, :description, :ingredients, :appliances, :instructions, :duration, :difficulty, :diet, :photo)
  # end
end
