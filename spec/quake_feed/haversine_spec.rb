require 'spec_helper'

describe Haversine do
  context "#distance" do
    let(:loc1) {Location.new(latitude: 38.898556, longitude: -77.037852)}
    let(:loc2) {Location.new(latitude: 38.897147, longitude: -77.043934)}

    it "calculates distance in kilometers" do
      dist = Haversine.distance(Haversine::EARTH_RADIUS_KILOMETERS, loc1, loc2)
      expect(dist).to eq(0.55)
    end

    it "calculates distance in kilometers to optional scale" do
      dist = Haversine.distance(Haversine::EARTH_RADIUS_KILOMETERS, loc1, loc2, 8)
      expect(dist).to eq(0.54932818)
    end

    it "calculates distance in miles" do
      dist = Haversine.distance(Haversine::EARTH_RADIUS_MILES, loc1, loc2)
      expect(dist).to eq(0.34)
    end

    it "calculates distance in miles to optional scale" do
      dist = Haversine.distance(Haversine::EARTH_RADIUS_MILES, loc1, loc2, 8)
      expect(dist).to eq(0.34142302)
    end
  end    
end
