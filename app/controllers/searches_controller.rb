class SearchesController < ApplicationController
  before_action :load_searches, only: [:index, :new, :create]
  before_action :load_results, only: [:new]
  before_action :create_or_update, only: [:create, :update, :show]

  def index
    redirect_to root_path
  end

  def new
    if params[:query].present?
      @search = Search.where(query: params[:query].downcase).first_or_initialize
      @search.save
      @search_record = SearchRecord.create(search_id: @search.id)
      @search_records = SearchRecord.where(search_id: @search.id)
      @results = load_results(@search.query)
    else
      @search = Search.new
    end
  end

  def create
  end

  def update
  end

  private
  def load_searches
    @searches = Search.all
  end

  def load_results(query=nil)
    if query
      service = NasaImagesService.new(query)
      service.search_images!
    end
  end

  def search_params
    params.permit(:query)
  end

  def create_or_update
    @search = Search.where(query: search_params[:query].downcase).first_or_initialize
    redirect_to new_search_path(query: @search.query)
  end
end
