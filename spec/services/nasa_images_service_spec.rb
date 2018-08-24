require "rails_helper"
require "vcr"

RSpec.describe NasaImagesService, :type => :service do
  context "Searching NASA's Image API" do
    it "has a service object" do
      expect(NasaImagesService).to be_kind_of Class
    end

    it "requires a search query" do
      expect { NasaImagesService.new }.to raise_error RuntimeError
    end

    it "performs a search" do
      VCR.use_cassette("apollo 11") do
        service = NasaImagesService.new "apollo 11"
        expect(service.search).to be_kind_of Hash
      end
    end
  end
end
