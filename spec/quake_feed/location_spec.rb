require 'spec_helper'


describe Location do
  it { should respond_to :latitude }
  it { should respond_to :longitude }

  context "#initialize" do
    it "can be initialized with no params" do
      expect(Location.new).to be_a(Location)
    end

    it "can be initialized with named params" do
      loc = Location.new(longitude: 123.4)
      expect(loc.longitude).to eq(123.4)
    end

    it "can be initialized with no params" do
      loc = Location.new(latitude: 123.4)
      expect(loc.latitude).to eq(123.4)
    end

    it "can be initialized with no params" do
      loc = Location.new(longitude: 321.4, latitude: 123.4)
      expect(loc.longitude).to eq(321.4)
      expect(loc.latitude).to eq(123.4)
    end
  end
end
