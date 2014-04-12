require 'dm-timestamps'

class Quake
  include DataMapper::Resource

  property :id,  Serial
  property :src, String
  property :eqid, String
  property :version, Integer
  property :datetime, DateTime
  property :latitude, Float
  property :longitude, Float
  property :magnitude, Float
  property :depth, Float
  property :nst, String
  property :region, String

  property :created_at, DateTime
  property :updated_at, DateTime

  def self.describe
    return {parameters: parameters, properties: props}
  end

  def self.parameters
    parameters = {}
    parameters["on"] = Parameter.new(name: "on", data_type: "Fixnum", description: "retrieve earthquakes that occurred on the argued time. Value should be seconds since epoch") 
    parameters["since"] = Parameter.new(name: "since", data_type: "Fixnum", description: "retrieve earthquakes that occurred on or after the argued time. Value should be seconds since epoch") 
    parameters["near"] = Parameter.new(name: "near", data_type: "String", description: "retrieve earthquakes that occurred within 5.0 miles of the argued latitude and longitude. Value should be of the form [latitude],[longitude]") 
    parameters["over"] = Parameter.new(name: "over", data_type: "Float", description: "retrieve earthquakes that with magnitudes greater then or equal to argued value") 
    return parameters
  end

  def self.props
    return Quake.properties.map{ |p| {name: p.name, data_type: p.primitive.to_s}} 
  end

end
