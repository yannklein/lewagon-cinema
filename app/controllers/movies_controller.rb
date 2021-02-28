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
    # accept multi youtube url type and standardize
    @movie.youtube_id = standardize_yt_id(@movie.youtube_id)
    if @movie.save
      redirect_to "#{movies_path}?selected_movie=#{@movie.id}"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    # accept multi youtube url type and standardize
    # movie_params["youtube_id"] = standardize_yt_id(movie_params["youtube_id"])
    if @movie.update(movie_params)
      redirect_to "#{movies_path}?selected_movie=#{@movie.id}"
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
    params["movie"]["youtube_id"] = standardize_yt_id(params["movie"]["youtube_id"])
    params.require(:movie).permit(:title, :description, :youtube_id, :project_category_id, :batch)
  end

  def standardize_yt_id(id)
    return nil if id.nil?

    # Possible input:
    # - https://youtu.be/QMDunGmWEAw?t=1639
    # - https://www.youtube.com/watch?v=37jQronuCYo
    # - https://www.youtube.com/watch?v=gcwB2wUWWPU&t=958s
    # - https://www.youtube.com/embed/gcwB2wUWWPU?start=1007
    # - gcwB2wUWWPU&t=958s
    # - gcwB2wUWWPU?start=958
    # Desiered output
    # - gcwB2wUWWPU&start=958
    id = id.gsub("https://www.youtube.com/watch?v=", "")
    id = id.gsub("https://www.youtube.com/embed/", "")
    id = id.gsub("https://youtu.be/", "")
    match_data = id.match(/\A(?<youtube_id>\w*)(&t=|\?start=)?(?<time>\d*)s?/)
    return match_data.nil? ? nil : "#{match_data[:youtube_id]}?start=#{match_data[:time]}"
  end
end
