require 'rails_helper'

RSpec.describe Search, :type => :model do
  it "should have many search records" do
    s = Search.reflect_on_association(:search_records)
    expect(s.macro).to eq(:has_many)
  end

  context "Updating a search" do
    let(:search) { Search.new(query: 'test') }
    it "has a count of zero when initialized" do
      expect(search.count).to be(0)
    end

    it "increments count when saved" do
      new_search = Search.new(query: 'new test')
      new_search.save
      expect(new_search.count).to be(1)
    end
  end
end
