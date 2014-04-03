require 'dm-timestamps'

class Quake
  include DataMapper::Resource

  property :id,  Serial
  property :src, String
  property :eqid, Integer
  property :version, Integer
  property :datetime, DateTime
  property :latitude, Float
  property :longitude, Float
  property :magnitude, Float
  property :depth, Float
  property :nst, Integer
  property :region, String

  property :created_at, DateTime
  property :updated_at, DateTime
end
