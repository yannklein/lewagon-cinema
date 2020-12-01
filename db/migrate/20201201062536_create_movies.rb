class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :youtube_id
      t.string :description
      t.string :category
      t.integer :batch

      t.timestamps
    end
  end
end
