class BookmarksController < ApplicationController
  before_action :set_list, only: %i[create]
  def new
    @bookmark = Bookmark.new
  end

  def create
    raise
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)

  #     def create
  #   #params is => {"authenticity_token"=>"[FILTERED]", "plant_tag"=>{"tag"=>"2"}, "commit"=>"Add tag!", "plant_id"=>"5"}
  #   @plant = Plant.find(params[:plant_id])
  #   @tags = Tag.where(id: params[:plant_tag][:tag]) # params[:plant_tag][:tag] will return an array
  #   @tags.each do |tag|
  #     @plant_tag = PlantTag.new(plant: @plant, tag: tag)
  #     @plant_tag.save
  #   end
  #   redirect_to garden_path(@plant.garden)
  # end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
