require "rails_helper"

RSpec.describe NasaImagesService, :type => :service do
  context "Searching NASA's Image API" do
    it "has a service object" do
      expect(NasaImagesService).to be_kind_of Class
    end

    it "requires a search query" do
      expect { NasaImagesService.new }.to raise_error RuntimeError
    end
  end
end
