class ReviewsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @recipe, notice: 'Review was successfully created.'
    else
      redirect_to @recipe, alert: 'Failed to create review.'
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
