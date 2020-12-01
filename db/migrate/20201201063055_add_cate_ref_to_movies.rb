class AddCateRefToMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :category
    add_reference :movies, :project_category, foreign_key: :true
  end
end
