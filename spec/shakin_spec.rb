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

  it "should return json for /earthquakes.json" do
    get "/v1/earthquakes.json"
    expect(last_response).to be_ok
    expect(last_response.header["content-type"]).to eq("application/json;charset=utf-8")
  end
end
