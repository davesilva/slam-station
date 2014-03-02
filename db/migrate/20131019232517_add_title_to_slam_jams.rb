class AddTitleToSlamJams < ActiveRecord::Migration
  def change
    add_column :slam_jams, :title, :string
  end
end
