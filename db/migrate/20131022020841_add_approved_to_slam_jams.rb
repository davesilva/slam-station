class AddApprovedToSlamJams < ActiveRecord::Migration
  def change
    add_column :slam_jams, :approved, :boolean, :default => false
  end
end
