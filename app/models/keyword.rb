class Keyword < ActiveRecord::Base

  has_many :game_keywords
  has_many :games, through: :game_keywords

  def self.keywordable(titles)
    word_value_hash = titles.flatten.each_with_object(Hash.new(0)) { |words,counts| counts[words] += 1 }
    keywords = word_value_hash.select{|word,v| v > 3}
    # .sort_by {|_key, value| value}
    # keywords.keys.each do |keyword|
    #   Keyword.create(keyword)
    # end 
    self.create_by(keywords) 
  end

  def self.create_by(keywords)
    keywords.keys.each do |keyword|
      self.create(name: keyword)
    end
  end

  def self.each_keyword
    self.all.each do |keyword|
      keyword.tag_games
    end  
  end

  def tag_games
    games = Game.where("name LIKE :query", query: "%#{self.name}%")
    games.each do |game|
      GameKeyword.create(game_id: game.id, keyword_id: self.id)
    end  
  end

end  
# matches = [["Super", "Mario", "64"],["Super", "Smash", "Bros."],["Super", "Mario", "64", "(Player's", "Choice)"]]
    # group = self.where("name LIKE :query", query: "%#{keyword}%")
    #     group.each do |game|
    #       game.update()
    #     end  

    # matches = titles.select {|title| title.include?(self.name)}
    # if !matches.empty?
    #   binding.pry
    #     matches.each do |game_title_array|
    #     title = game_title_array.join(" ")
    #     game = Game.where("name LIKE :query", query: "%#{self.name}%")
    #     GameKeyword.create(game_id: game.id, keyword_id: self.id)
    #   end
    # end  