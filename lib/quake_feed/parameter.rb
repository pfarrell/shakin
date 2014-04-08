class Parameter 
  attr_accessor :name, :data_type, :description, :value, :default

  def initialize(opts={})
    @required = false
    @or_required = false
    opts.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def to_json(opts = {})
    return {:name=>@name, :data_type=>@data_type, :description=>@description}
  end
end
