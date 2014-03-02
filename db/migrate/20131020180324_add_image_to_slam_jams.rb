class AddImageToSlamJams < ActiveRecord::Migration
  def change
    add_column :slam_jams, :img_url, :string
  end
end
