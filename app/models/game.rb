class Game < ActiveRecord::Base

  has_many :game_keywords
  has_many :keywords, through: :game_keywords

  def self.titles
    titles = []
    self.all.each do |game|
      titles << game.name.split(" ")
    end
    Keyword.keywordable(titles)
    Keyword.each_keyword
  end




  #platform id 43 = N64 #275 : SNES --> 9 #707 : NES --> 21 #683   ### 1665
  def self.persist_all_games 
    platforms = ['43','9','21'] 
    platforms.each do |platform_id|
      GameClient.new(platform_id).api
    end
    self.titles
  end 

end