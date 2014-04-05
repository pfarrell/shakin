class Location
  attr_accessor :latitude, :longitude

  def initialize(opts={})
    @latitude ||= opts[:latitude]
    @longitude ||= opts[:longitude]
  end
end

