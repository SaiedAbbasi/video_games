class GameKeyword < ActiveRecord::Base
  belongs_to :game
  belongs_to :keyword
end