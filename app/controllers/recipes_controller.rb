class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
