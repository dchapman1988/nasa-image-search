require 'rails_helper'

RSpec.describe SearchesController, :type => :controller do
  describe "GET new without a query" do
    it "assigns @searches with a query" do
      get :new
      expect(assigns(:searches)).to eq([])
    end
  end

  describe "GET new with a query" do
    it "assigns @searches with a query" do
      search = Search.new(query: "apollo 11")
      search.save
      VCR.use_cassette("apollo 11 search") do
        get :new, params: {:query => "apollo 11"}
        expect(assigns(:searches)).to eq([search])
      end
    end
  end

  describe "GET index" do
    it "redirects you to the root path" do
      get :index
      expect(response).to redirect_to("/")
    end
  end

  describe "POST index" do
    it "redirects you to the root path" do
      search = Search.new(query: "apollo 11")
      search.save
      post :create, params: { query: "apollo 11" }
      VCR.use_cassette("apollo 11 search") do
        get :new, params: {:query => "apollo 11"}
        expect(assigns(:searches)).to eq([search])
      end
    end
  end
end
