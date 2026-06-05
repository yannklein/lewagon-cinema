class LwCinemaMoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :update, :destroy]

  def index
    @movies = LwCinemaMovie.all
    @featured_movies = @movies.sample(4)
    @current_movie = @featured_movies.first
    if params[:selected_movie].present?
      @current_movie = LwCinemaMovie.find(params[:selected_movie].to_i)
    end
  end

  def new
    @movie = LwCinemaMovie.new
  end

  def create
    @movie = LwCinemaMovie.new(movie_params)
    # accept multi youtube url type and standardize
    @movie.youtube_id = standardize_yt_id(@movie.youtube_id)
    if @movie.save
      redirect_to "#{lw_cinema_movies_path}?selected_movie=#{@movie.id}"
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
      redirect_to "#{lw_cinema_movies_path}?selected_movie=#{@movie.id}"
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to lw_cinema_movies_path
  end

  private

  def set_movie
    @movie = LwCinemaMovie.find(params[:id])
  end

  def movie_params
    params["lw_cinema_movie"]["youtube_id"] = standardize_yt_id(params["lw_cinema_movie"]["youtube_id"])
    params.require(:lw_cinema_movie).permit(:title, :description, :youtube_id, :lw_cinema_project_category_id, :batch)
  end

  def standardize_yt_id(id)
    return nil if id.nil?

    # hV3tRDmsq-A&t=2040s
    # https://youtu.be/hV3tRDmsq-A?t=2040

    # Possible input:
    # - https://youtu.be/QMDunGmWEAw?t=1639
    # - https://www.youtube.com/watch?v=37jQronuCYo
    # - https://www.youtube.com/watch?v=gcwB2wUWWPU&t=958s
    # - https://www.youtube.com/embed/gcwB2wUWWPU?start=1007
    # - https://youtu.be/hV3tRDmsq-A?t=2040
    # - gcwB2wUWWPU&t=958s
    # - gcwB2wUWWPU?start=958
    # Desiered output
    # - gcwB2wUWWPU&start=958
    id = id.gsub("https://www.youtube.com/watch?v=", "")
    id = id.gsub("https://www.youtube.com/embed/", "")
    id = id.gsub("https://youtu.be/", "")
    match_data = id.match(/\A(?<youtube_id>[^&?]+)(&|\?)?(t=|start=)?(?<time>\d*)s?/)
    return match_data.nil? ? nil : "#{match_data[:youtube_id]}?start=#{match_data[:time]}"
  end
end
