class NasaImagesService

  def initialize(search_query=nil)
    raise "You must provide a search query." unless search_query
    @search_query = search_query
  end

end
