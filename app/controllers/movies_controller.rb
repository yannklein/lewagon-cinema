class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @current_movie = @movies.first
    if params[:selected_movie].present?
      @current_movie = Movie.find(params[:selected_movie].to_i)
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
