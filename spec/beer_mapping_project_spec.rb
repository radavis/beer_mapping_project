require 'spec_helper'

describe BeerMappingProject, :vcr do
  describe "#name_search" do
    it "should return a brewery when given a name" do
      breweries = BeerMappingProject.new.name_search("Jack's Abby Brewing")
      expect(breweries.count).to eq(1)
      expect(breweries.first.name).to eq("Jack's Abby Brewing")
    end
  end

  describe "#city_search" do
    let(:breweries) { BeerMappingProject.new.city_search("Boston") }

    it "should return a collection of brewery objects" do
      expect(breweries.first).to be_a Brewery
    end

    it "should return breweries in a given city" do
      breweries.each do |brewery|
        expect(brewery.city).to eq("Boston")
      end
    end
  end

  describe "#state_search" do
    let(:breweries) { BeerMappingProject.new.state_search("MA") }

    it "should return breweries in a given state" do
      breweries.each do |brewery|
        expect(brewery.state).to eq("MA")
      end
    end
  end
end
