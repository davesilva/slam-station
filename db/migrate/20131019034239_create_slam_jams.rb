class CreateSlamJams < ActiveRecord::Migration
  def change
    create_table :slam_jams do |t|
      t.string :youtube_id

      t.timestamps
    end
  end
end
