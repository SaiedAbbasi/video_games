class GamesController < ApplicationController

  def index
    search = game_params["name"]
    terms = search.split(" ")

    if terms.count == 1 && Keyword.all.include?(search) || terms.count == 2 && Keyword.all.include?(terms[0]) && !Keyword.all.include?(terms[1])
        keyword_id = Keyword.find_by(name: term[0].capitalize).id
        game_ids = GameKeyword.where(keyword_id: keyword_id).pluck(:game_id)
        @games = game_ids.map do |game_id|
          Game.where(id: game_id)[0]
        end
    elsif terms.count == 1 && Keyword.all.include?(search) || terms.count == 2 && !Keyword.all.include?(terms[0]) && Keyword.all.include?(terms[1])
        keyword_id = Keyword.find_by(name: terms[1].capitalize).id
        game_ids = GameKeyword.where(keyword_id: keyword_id).pluck(:game_id)
        @games = game_ids.map do |game_id|
          Game.where(id: game_id)[0]
        end    
    elsif terms.count == 2 && Keyword.all.include?(terms[0]) && Keyword.all.include?(terms[1])
        keyword_id = Keyword.find_by(name: terms[0].capitalize).id
        game_ids = GameKeyword.where(keyword_id: keyword_id).pluck(:game_id)
        games1 = game_ids.map do |game_id|
          Game.where(id: game_id)[0]
        end 
        keyword_id = Keyword.find_by(name: terms[1].capitalize).id
        game_ids = GameKeyword.where(keyword_id: keyword_id).pluck(:game_id)
        games2 = game_ids.map do |game_id|
          Game.where(id: game_id)[0]
        end
        @games = games1 & games2
    elsif Game.find_by(name: search) != nil
      @games = []
      @games << Game.find_by(name: search)
    else 
      @games = Game.where("name LIKE :query", query: "%#{search}%")
    end  
  end

  private

    def game_params
      params.permit("name")
    end  

end


