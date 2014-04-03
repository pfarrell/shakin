require 'dm-timestamps'

class Quake
  include DataMapper::Resource

  property :id,  Serial
  property :import_date, DateTime
  property :created_at, DateTime
  property :updated_at, DateTime
end
