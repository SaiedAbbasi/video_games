class GameAdapter

  attr_reader :platform

  def initialize(platform)
    @platform = platform
  end
  
  def response(offset = 0)
    sleep(1)
    url = ("https://www.giantbomb.com/api/releases/?api_key=2fd8ee4e1ac93cf2d9d1e453f8db052b1d5e17c6&format=json&offset=#{offset}&field_list=name,site_detail_url,image,deck,platform,game_rating&filter=region:1,platform:#{self.platform}")
    results = HTTParty.get(url)
  end

  # def cyles(results)
  #   results["results"]["number_of_total_results"] / 100
  # end  

  # def repeat?(results)
  #   offset = 100
  #   if results["results"]["number_of_total_results"]
  # end  

  # def response_data(all_details)
  #   result = all_details["results"]
  # end  

end  