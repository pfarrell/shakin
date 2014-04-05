class Haversine

  EARTH_RADIUS_MILES = 3961
  EARTH_RADIUS_KILOMETERS = 6373

  def self.distance(radius, loc1, loc2, scale=2)
    d_lat = to_rad(loc2.latitude - loc1.latitude)
    d_lon = to_rad(loc2.longitude - loc1.longitude)
    a = Math.sin(d_lat/2) * Math.sin(d_lat/2) +
    Math.cos(to_rad(loc1.latitude)) * Math.cos(to_rad(loc2.latitude)) *
    Math.sin(d_lon/2) * Math.sin(d_lon/2);
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    dist = radius * c
    return (dist*10**scale).round / 10.0**scale
  end

  private
  def self.to_rad(degrees)
    return degrees * Math::PI / 180
  end
end
