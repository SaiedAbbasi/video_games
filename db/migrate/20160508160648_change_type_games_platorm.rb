class ChangeTypeGamesPlatorm < ActiveRecord::Migration
  def change
    change_column :games, :platform, :text
  end
end
