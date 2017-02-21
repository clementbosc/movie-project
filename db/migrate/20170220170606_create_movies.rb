class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :release_date
      t.text :overview
      t.string :budget
      t.string :homepage
      t.string :original_language
      t.string :original_title
      t.float :popularity
      t.string :revenue
      t.string :status
      t.string :tagline
      t.string :backdrop_path
      t.string :poster_path

      t.timestamps
    end
  end
end
