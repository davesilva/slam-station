class AddArtistToSlamJams < ActiveRecord::Migration
  def change
    add_column :slam_jams, :artist, :string
  end
end
