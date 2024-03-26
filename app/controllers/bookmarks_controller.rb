class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save!
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy!
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:user_id, :recipe_id)
  end
end
