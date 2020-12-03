class MoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :update, :destroy]

  def index
    @movies = Movie.all
    @featured_movies = @movies.sample(4)
    @current_movie = @featured_movies.first
    if params[:selected_movie].present?
      @current_movie = Movie.find(params[:selected_movie].to_i)
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :youtube_id, :project_category_id, :batch)
  end
end
