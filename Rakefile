require "bundler/gem_tasks"
require 'data_mapper'

import "lib/tasks/import_quakes.rake"

namespace :db do
  task :migrate do
    DataMapper::Model.raise_on_save_failure = true
    DataMapper.setup(:default, ENV["DATABASE_URL"] || 'postgres://localhost/quakes')
    DataMapper.auto_upgrade!
  end
end
