class AddCateRefToMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :lw_cinema_movies, :category
    add_reference :lw_cinema_movies, :lw_cinema_project_category, foreign_key: { to_table: :lw_cinema_project_categories }
  end
end
