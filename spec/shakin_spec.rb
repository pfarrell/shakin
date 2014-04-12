require 'spec_helper'

describe 'Shakin, a Sinatra joint,' do

  it "should allow access to the home page" do
    get "/"
    expect(last_response).to be_ok
  end

  it "should return html to /v1/earthquakes" do
    get "/v1/earthquakes"
    expect(last_response).to be_ok
    expect(last_response.header["content-type"]).to eq("text/html;charset=utf-8")
  end

  it "should return html to /v1/describe/earthquakes" do
    get "/v1/earthquakes"
    expect(last_response).to be_ok
    expect(last_response.header["content-type"]).to eq("text/html;charset=utf-8")
  end

  context "#earthquakes" do
    let(:earthquakes) {"hello"}
    it "should return json for /v1/earthquakes.json" do
      setup!("/v1/earthquakes", earthquakes)
      get "/v1/earthquakes.json"
      expect(last_response).to be_ok
      expect(last_response.header["content-type"]).to eq("application/json;charset=utf-8")
    end
  end
  
  it "should return json for /v1/describe/earthquakes.json" do
    get "/v1/earthquakes.json"
    expect(last_response).to be_ok
    expect(last_response.header["content-type"]).to eq("application/json;charset=utf-8")
  end
end
