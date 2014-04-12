require 'spec_helper'

describe Quake do
  context "self.describe" do
    it "has a method to describe itself" do
      expect(Quake.describe).to be_a(Hash)
      expect(Quake.describe[:parameters]).to be_a(Hash)
      expect(Quake.describe[:properties]).to be_an(Array)
    end
  end

  context "self.parameters" do
    it "has a method to document accepted query string params" do
      expect(Quake.parameters).to be_a(Hash)
    end
  end

  context "self.props" do
    it "has a method to document accepted query string params" do
      expect(Quake.props).to be_an(Array)
    end
  end
end
