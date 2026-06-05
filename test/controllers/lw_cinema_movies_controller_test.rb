require 'test_helper'

class LwCinemaMoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lw_cinema_movies_url
    assert_response :success
  end

  test "should get new" do
    get new_lw_cinema_movie_url
    assert_response :success
  end

  test "should get edit" do
    get edit_lw_cinema_movie_url
    assert_response :success
  end

end
