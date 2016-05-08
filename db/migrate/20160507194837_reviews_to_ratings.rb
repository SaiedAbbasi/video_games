class ReviewsToRatings < ActiveRecord::Migration
  def change
    rename_column :games, :reviews, :rating
  end
end
