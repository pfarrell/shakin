require 'spec_helper'

ENV['RACK_ENV'] = 'test'

describe Parameter do

  let(:p) {Parameter.new( name: "test_name", data_type: "numberical", description: "dwim param", value: "octarine", default: "olive juice")}

  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :data_type }
  it { should respond_to :value }

  context "#intialize" do
    it "can initialize named params" do
      expect(p.name).to eq("test_name")
    end
  end

  context "#json" do
    it "is jsonable" do
      expect(p.to_json).to eq({name: "test_name", data_type: "numberical", description: "dwim param"}.to_json)
    end
  end

end
