class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :name
      t.text :image
      t.text :reviews
      t.text :deck
      t.integer :platform

      t.timestamps null: false
    end
  end
end
