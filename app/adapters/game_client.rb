class GameClient

  def initialize(platform)
    @connection ||= GameAdapter.new(platform)
  end

  def api
    @results = @connection.response
    self.adapt
    self.repeat?
  end  

  def adapt
    @results["results"].each do |result|
      result["game_rating"] ? rating = result["game_rating"]["name"] : rating = 'N/A'
      result["image"] ? image = result["image"]["medium_url"] : image = 'N/A'
      result["name"] ? name = result["name"] : name = 'N/A'
      result["deck"] ? deck = result["deck"] : deck = 'N/A'
      result["site_detail_url"] ? link = result["site_detail_url"] : link = 'N/A' 
      result["platform"]["name"] ? platform = result["platform"]["name"] : platform = 'N/A'
      Game.create(name: name, deck: deck, image: image, rating: rating, link: link, platform: platform)
    end
  end  

  def repeat?  
    offset = 100
    while @results["number_of_total_results"].to_i / offset > 0
      @results = @connection.response(offset)
      self.adapt
      offset += 100
    end  
  end
  
end  
