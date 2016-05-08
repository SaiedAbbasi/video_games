class GameAdapter

  attr_reader :platform

  def initialize(platform)
    @platform = platform
  end
  
  def response(offset = 0)
    sleep(1)
    url = ("https://www.giantbomb.com/api/releases/?api_key=ENTERAPIKEY&format=json&offset=#{offset}&field_list=name,site_detail_url,image,deck,platform,game_rating&filter=region:1,platform:#{self.platform}")
    results = HTTParty.get(url)
  end 

end  
