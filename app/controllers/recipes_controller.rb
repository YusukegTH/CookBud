class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @recipes = Recipe.all

    @content = set_recipe_content
    recipe_string = @content

    recipe_name_match = recipe_string.match(/Name: (.+)/)
    @recipe_name = recipe_name_match ? recipe_name_match[1] : "Not specified"

    ingredients_match = recipe_string.match(/Ingredients: (.+)/)
    @ingredients = ingredients_match ? ingredients_match[1] : "Not specified"

    difficulty_match = recipe_string.match(/Difficulty: (\w+)/)
    @difficulty = difficulty_match ? difficulty_match[1] : "Not specified"

    duration_match = recipe_string.match(/Duration: (\d+)/)
    @duration = duration_match ? duration_match[1] : "Not specified"

    description_match = recipe_string.match(/Description: (.+)/)
    @description = description_match ? description_match[1] : "Not specified"
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_recipe_content
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "What´s a recipe that uses only ${current_user.preferences.ingredients} and ${current_user.preferences.appliances} to cook. Give me only the name, the ingredients, the duration, the difficulty of the recipe and a Description without any of your own answer like 'Here is a simple recipe'."}]
    })
    @content = chaptgpt_response["choices"][0]["message"]["content"]
  end

end
