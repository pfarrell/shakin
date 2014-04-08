require 'spec_helper'

ENV['RACK_ENV'] = 'test'

describe Parameter do

  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :data_type }
  it { should respond_to :value }
end
