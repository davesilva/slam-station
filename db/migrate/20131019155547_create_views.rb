class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.references :user
      t.references :slam_jam
      t.column :viewed_at, :datetime

      t.timestamps
    end
  end
end
