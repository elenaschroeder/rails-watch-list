class BookmarksController < ApplicationController
  before_action :find_bookmark, only: :destroy
  before_action :find_list, only: [:new, :create]

  def create
    @bookmark = Bookmark.new(require_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmark_path(@bookmark.list)
  end

  def new
    @bookmark = Bookmark.new
  end


  def require_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

  def find_list
    @list = List.find(params[:list_id])
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
