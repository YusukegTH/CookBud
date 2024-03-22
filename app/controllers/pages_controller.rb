class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :search ]

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
    @search = search_preference
    @filtered_recipes = Recipe.filter_with_preference(@search)
  end

  private

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

  # def recipe_params
  #   params.require(:recipe).permit(:name, :description, :ingredients, :appliances, :instructions, :duration, :difficulty, :diet, :photo)
  # end
end
