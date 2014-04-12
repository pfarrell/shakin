require 'spec_helper'
require 'byebug'

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
    get "/v1/describe/earthquakes.json"
    expect(last_response).to be_ok
    expect(last_response.header["content-type"]).to eq("application/json;charset=utf-8")
    doc = JSON.parse(last_response.body)
    expect(doc).to be_a(Hash)
  end

  it "can filter on the day an earthquake occurred in seconds since epoch" do
    get "/v1/earthquakes.json?on=1397240499"
    expect(last_response).to be_ok
    expect(last_response.header["content-type"]).to eq("application/json;charset=utf-8")
    doc = JSON.parse(last_response.body)
    expect(doc["data"].size).to eq(35)
  end

  it "can filter on earthquakes after a date in seconds since epoch" do
    get "/v1/earthquakes.json?since=1397240499"
    expect(last_response).to be_ok
    expect(last_response.header["content-type"]).to eq("application/json;charset=utf-8")
    doc = JSON.parse(last_response.body)
    expect(doc["data"].size).to eq(12)
  end
  
  it "can filter on earthquakes over a specific magnitude" do
    get "/v1/earthquakes.json?over=4.0"
    expect(last_response).to be_ok
    expect(last_response.header["content-type"]).to eq("application/json;charset=utf-8")
    doc = JSON.parse(last_response.body)
    expect(doc["data"].size).to eq(3)
  end

  it "can filter on earthquakes within 5 miles of a specific latitude,longitude" do
    get "/v1/earthquakes.json?near=38.8205,-122.7658"
    expect(last_response).to be_ok
    expect(last_response.header["content-type"]).to eq("application/json;charset=utf-8")
    doc = JSON.parse(last_response.body)
    expect(doc["data"].size).to eq(22)
  end
end
