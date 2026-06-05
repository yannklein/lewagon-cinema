class LwCinemaMovie < ApplicationRecord
  belongs_to :lw_cinema_project_category, foreign_key: "lw_cinema_project_category_id"
  validates :title, presence: true
  validates :description, presence: true
  validates :batch, presence: true
  validates :youtube_id, presence: true
end
