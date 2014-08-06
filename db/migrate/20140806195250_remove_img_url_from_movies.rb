class RemoveImgUrlFromMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :img_url, :string
  end
end
