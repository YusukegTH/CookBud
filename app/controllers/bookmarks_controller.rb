class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.recipe = Recipe.find(params[:recipe_id])
    @bookmark.save!
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy!
  end
end
