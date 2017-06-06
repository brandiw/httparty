class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.string :title
      t.string :artwork_url
      t.string :preview_url
      t.string :artist
      t.integer :track_length

      t.timestamps
    end
  end
end
