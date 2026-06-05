class CreateProjectCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :lw_cinema_project_categories do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
