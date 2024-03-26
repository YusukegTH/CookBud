class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :search, :search_results ]
  require 'open-uri'

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
    @recipe = Recipe.find(params[:recipe_id])
  end

  def search_results
    @search = search_preference
    @filtered_recipes = filter_with_preference(@search)
    @search_ai = searchAi(@search)
    @image_ai = imageAi
    @filtered_recipes.append(@recipe)
  end

  def preference_edit
    @preference = current_user.preference
  end

  private

  # makes a prompt to OpenAI API to generate a photo
  def imageAi
    client = OpenAI::Client.new
    response = client.images.generate(parameters: { prompt: "delicous picture of #{@recipe.name}", size: "512x512" })
    @url = response.dig("data", 0, "url")
    return @url
  end

  # makes a prompt to OpenAI API to generate a recipe and call the imageAi method to attach a photo to the recipe
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
    file = URI.open(imageAi)
    @recipe.photo.attach(io: file, filename: "#{@recipe_name}.jpg", content_type: "image/png")
    @recipe.save!
  end

  def set_recipe_content(search)
    client = OpenAI::Client.new
    # test_user1 = User.last
    prompt = "What´s a recipe that uses only #{search.ingredients.join(', ')} and #{search.appliances.join(', ')} to cook. Give me only the name with Name:, the ingredients used in the recipe, the duration, the difficulty defined as Beginner, Intermediate, Advanced and a Description, followed by the steps you need to cook it without any of your own answer like 'Here is a simple recipe'."
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: prompt}]
    })
    @content = chaptgpt_response["choices"][0]["message"]["content"]
  end

  def search_preference
    preference = {}
    params[:appliances].size > 1 ? preference[:appliances] = params[:appliances].chop.split(',') : preference[:appliances] = ""
    params[:ingredients].size > 1 ? preference[:ingredients] = params[:ingredients].chop.split(',') : preference[:ingredients] = ""
    params[:diet].size > 1 ? preference[:diet] = params[:diet].chop.split(',') : preference[:diet] = ""
    params[:allergies].size > 1 ? preference[:allergies] = params[:allergies].chop.split(',') : preference[:allergies] = ""
    preference[:level] = params[:level]
    preference[:duration] = params[:duration]
    preference
  end

  # Search results algorithm

  def filter_with_preference(search)
    filtered_results = []
    if search[:level] == "beginner"
      search_results = Recipe.where(difficulty: "beginner")
    elsif search[:level] == "intermediate"
      search_results = Recipe.where(difficulty: ["beginner", "intermediate"])
    else
      search_results = Recipe.all
    end
    search_results = search_results.where("duration <= ?", search[:duration].to_i) if search[:duration] != ""
    search_results.each do |recipe|
      if contained_in?(recipe.appliances, search[:appliances]) && contained_in?(recipe.ingredients, search[:ingredients]) && contained_in?(recipe.diet, search[:diet])
        filtered_results << recipe
      end
    end
    filtered_results
  end

  def contained_in?(recipe, search)
    JSON.parse(recipe).all? { |item| search.include?(item) }
  end

  def check_allergies?(preference, recipe)
    !contains_all?(preference[:allergies], JSON.parse(recipe.ingredients))
  end
end
