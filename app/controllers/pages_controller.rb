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
    @preference = search_preference
    @filtered_recipes = Recipe.filter_with_preference(@preference)
  end

  private

  def search_preference
    preference = {}
    preference[:appliances] = params[:search][:appliances] if params[:search][:appliances].present?
    preference[:ingredients] = params[:search][:ingredients] if params[:search][:ingredients].present?
    preference[:diet] = params[:search][:diet] if params[:search][:diet].present?
    preference[:allergies] = params[:search][:allergies] if params[:search][:allergies].present?
    preference[:level] = params[:search][:level] if params[:search][:level].present?
    preference[:duration] = params[:search][:duration] if params[:search][:duration].present?
    preference
  end

  # def recipe_params
  #   params.require(:recipe).permit(:name, :description, :ingredients, :appliances, :instructions, :duration, :difficulty, :diet, :photo)
  # end
end
