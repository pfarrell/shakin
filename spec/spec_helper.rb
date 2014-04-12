require 'webmock/rspec'
require 'simplecov'
require 'rack/test'
require 'rake'
require 'data_mapper'

ENV['RACK_ENV'] = 'test'
ENV['DATABASE_URL'] = 'sqlite::memory:'

WebMock.disable_net_connect!

  DataMapper.setup(:default, ENV["DATABASE_URL"] || 'postgres://localhost/quakes')
  DataMapper.auto_upgrade!
  DataMapper.finalize

  require 'rake'
  rake = Rake::Application.new
  Rake.application = rake
  rake.init
  rake.load_rakefile
  rake['db:migrate'].invoke
  rake['import'].invoke

module RSpecMixin
  include Rack::Test::Methods
  def app() Shakin end
end

module SetupHelper
  def setup!(endpoint, fixture)
    stub_request(:get, endpoint).
      to_return(:status => 200, :body => fixture.to_json, :headers => {'Content-Type' => 'application/json'})
  end

end

SimpleCov.start do
  add_filter "/vendor/"
  add_filter "/spec/"
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
  config.include RSpecMixin
  config.include SetupHelper
end


require 'quake_feed'
require './shakin'
