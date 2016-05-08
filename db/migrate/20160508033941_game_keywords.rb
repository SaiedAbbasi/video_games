class GameKeywords < ActiveRecord::Migration
  def change
    create_table :game_keywords do |t|
      t.integer :game_id
      t.integer :keyword_id
    end
  end
end
