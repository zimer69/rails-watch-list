class MoviesController < ApplicationController
  before_action :set_list, only: %i[show]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = movie.new(movie_params)
    @movie.save
    redirect_to lists_path
  end

  def show; end

  private

  def set_movie
    @movie = movie.find(params[:id])
  end
end
