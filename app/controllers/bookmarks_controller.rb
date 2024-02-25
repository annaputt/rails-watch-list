class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ destroy ]
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to @bookmark, notice: "Bookmark was successfully created."
    else
      # @review = Review.new
      #remove @review if necessary
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy!
    redirect_to bookmarks_url, notice: "Bookmark was successfully destroyed.", status: :see_other
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
