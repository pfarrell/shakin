require 'sinatra'
require 'sinatra/respond_to'
require 'data_mapper'
require 'dm-geokit'
require 'quake_feed'
require 'haml'
require 'json'
require 'sinatra/url_for'
require 'active_support/all'

class Shakin < Sinatra::Base
  register Sinatra::RespondTo

  helpers Sinatra::UrlForHelper

  #DataMapper::Logger.new(STDOUT, :debug) 
  DataMapper.setup(:default, ENV["DATABASE_URL"] || 'postgres://localhost/quakes')
  DataMapper.auto_upgrade!
  DataMapper.finalize

  def get_quakes(params)
    quakes = Quake.all

    if(params["on"])
      date = DateTime.strptime(params["on"], "%s").new_offset("-07:00")
      quakes = quakes.all(:datetime.gte => date.beginning_of_day, :datetime.lt => date.end_of_day)
    end

    if(params["since"])
      date = DateTime.strptime(params["since"], "%s").new_offset("-07:00")
      quakes = quakes.all(:datetime.gte => date)
    end

    if(params["over"])
      quakes = quakes.all(:magnitude.gt => params["over"].to_f)
    end

    if(params["near"])
      nearby_quakes = []
      lat, long = params["near"].split(",").map {|s| s.to_f}
      test_loc = Location.new(latitude: lat, longitude: long)
      quakes.each do |quake|
        quake_loc = Location.new(latitude: quake.latitude, longitude: quake.longitude)
        dist = Haversine.distance(Haversine::EARTH_RADIUS_MILES, test_loc, quake_loc) 
        nearby_quakes << quake if dist <= 5.0
      end
      quakes = nearby_quakes
    end
      
    return quakes
  end

  get "/" do
    haml :index
  end

  get "/earthquakes" do
    quakes = get_quakes(params)
    respond_to do |wants|
      wants.json { RecordSet.new(data: quakes).to_json }
      wants.html { haml :quakes, locals: {data: quakes, desc: "List of all recent earthquakes"}}
    end
  end
end
