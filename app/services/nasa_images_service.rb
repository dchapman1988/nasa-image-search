require 'json'
class NasaImagesService
  BASE_URL = "https://images-api.nasa.gov/"

  def initialize(search_query=nil)
    raise "You must provide a search query." unless search_query
    @search_query = search_query
  end

  def search
    response = ::Curl::Easy.http_get(BASE_URL + "search?q=#{@search_query}") do |curl|
      curl.ssl_verify_peer = false
    end
    parse_response(response.body) 
  end

  def parse_response(response)
    JSON.parse(response)
  end
end
