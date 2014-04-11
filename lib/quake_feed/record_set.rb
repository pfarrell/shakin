require 'date'
require 'csv'
#require 'active_support/core_ext/object'

class RecordSet
  attr_accessor :date, :data, :errors, :next, :prev, :uri

  def initialize(opts={})
    @date=DateTime.now
    @errors=[]
    @properties=[]

    opts.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def to_json(options = {})
    return {date: @date, errors: @errors, data: @data}.to_json
  end

end
