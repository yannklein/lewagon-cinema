class LwCinemaProjectCategory < ApplicationRecord
  has_many :lw_cinema_movies, foreign_key: "lw_cinema_project_category_id"
end
