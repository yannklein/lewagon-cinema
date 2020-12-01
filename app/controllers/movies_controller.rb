class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @current_movie = @movies.first
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
  end

  def destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :youtube_id, :project_category_id, :batch)
  end
end
