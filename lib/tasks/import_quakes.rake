require 'dm-core'              
require 'dm-migrations'
require 'open-uri'
require 'csv'
require 'quake_feed'

task :import, :debug do |t,args|
  DataMapper::Logger.new(STDOUT, :debug) if args.debug == "debug"
  DataMapper::Model.raise_on_save_failure = true
  DataMapper.setup(:default, ENV["DATABASE_URL"] || 'postgres://localhost/quakes')
  DataMapper.finalize

  case ENV['RACK_ENV']
    when 'test'
      quake_data = 'spec/fixtures/eqs7day-M1.txt'
    else
      quake_data = 'http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt' 
  end
  file = open(quake_data)

  c = CSV.open(file)
  c.drop(2).each do |row|
    if(Quake.first(:eqid => row[1], :datetime => row[3]).nil?)
      quake = Quake.new
      quake.src       = row[0]
      quake.eqid      = row[1]
      quake.version   = row[2]
      quake.datetime  = row[3]
      quake.latitude  = row[4]
      quake.longitude = row[5]
      quake.magnitude = row[6]
      quake.depth     = row[7]
      quake.nst       = row[8]
      quake.region    = row[9]
      begin
        quake.save
      rescue Exception => ex
        puts ex.inspect
      end
    end
  end

  puts "#{Quake.count} quakes!!!"
end
