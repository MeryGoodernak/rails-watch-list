class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[destroy edit]

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(:id)
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
