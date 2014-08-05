class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :runtime_in
      t.integer :minutes
      t.text :description

      t.timestamps
    end
  end
end
