class ReviewsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to recipe_path(@review.recipe), notice: "Review was successfully created."
    else
      redirect_to recipe_path(@recipe), alert: "Review wasn't created."
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
