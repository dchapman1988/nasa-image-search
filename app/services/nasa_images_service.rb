require 'json'
class NasaImagesService
  BASE_URL = "https://images-api.nasa.gov/"

  def initialize(search_query=nil)
    # Lets give the user detailed feedback instead of an ArgumentError.
    raise "You must provide a search query." unless search_query
    @search_query = search_query
  end

  def search
    # Restrict our search to media_type=image since that's what we really care about
    response = ::Curl::Easy.http_get(BASE_URL + "search?media_type=image&q=#{@search_query}") do |curl|
      curl.ssl_verify_peer = false
    end
    parse_response(response.body) 
  end

  def search_images!
    results = search
    collect_images(results)
  end

  def parse_response(response)
    JSON.parse(response)
  end

  def collect_images(results)
    # Shove the last href of each collection item from the API into our images array
    images = []
    results["collection"]["items"].each do |item|
      images << item["links"].last["href"]
    end
    images
  end
end
