class Movie < ApplicationRecord
  belongs_to :project_category
  validates :title, presence: true
  validates :description, presence: true
  validates :batch, presence: true
  validates :title, presence: true
  validates :youtube_id, presence: true
end
