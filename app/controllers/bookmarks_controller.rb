class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  skip_before_action :authenticate_user!, except: %i[create new]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @movies = Movie.where(id: params[:bookmark][:movie]) # params[:plant_tag][:tag] will return an array
    @movies.each do |movie|
      @bookmark = Bookmark.new(list: @list, movie: movie)
      @bookmark.save
    end
    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
