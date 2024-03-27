class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @reviews = @recipe.reviews.includes(:user)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
