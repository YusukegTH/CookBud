class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
