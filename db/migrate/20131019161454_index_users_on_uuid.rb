class IndexUsersOnUuid < ActiveRecord::Migration
  def up
    add_index :users, :uuid
  end

  def down 
    remove_index :users, :uuid
  end
end
