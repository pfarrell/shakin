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

  def to_csv(options = {})
    csv_opts = { headers: @properties, write_headers: true }

    csv_string = CSV.generate(csv_opts) do |csv|
      @data.each do |row|
        # make sure we add the row data in the same order as the headers
        csv << properties.collect { |p| row[p] }
      end
    end

    return csv_string
  end
end
