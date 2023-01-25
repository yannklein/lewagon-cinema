class ProjectCategory < ApplicationRecord
  self.table_name = "lw_cinema_project_categories"
  has_many :movies, foreign_key: "lw_cinema_project_category_id"
end
