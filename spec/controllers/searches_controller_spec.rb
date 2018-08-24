require 'rails_helper'

RSpec.describe SearchesController, :type => :controller do
  describe "GET new with a query" do
    it "assigns @searches" do
      search = Search.new(query: "apollo 11")
      search.save
      VCR.use_cassette("apollo 11 search") do
        get :new, params: {:query => "apollo 11"}
        expect(assigns(:searches)).to eq([search])
      end
    end
  end
end
