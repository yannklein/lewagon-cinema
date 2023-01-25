class Movie < ApplicationRecord
  self.table_name = "lw_cinema_movies"
  belongs_to :project_category, foreign_key: "lw_cinema_project_category_id"
  validates :title, presence: true
  validates :description, presence: true
  validates :batch, presence: true
  validates :title, presence: true
  validates :youtube_id, presence: true
end
