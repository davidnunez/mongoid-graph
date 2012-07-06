gem 'mongoid', '=3.0.0.rc'

require "rspec"
require "spork"
require "mongoid"
require "mongoid-graph"
require "support/node"

Spork.prefork do

  Mongoid.configure do |config|
    config.connect_to("mongoid-graph")
  end

  RSpec.configure do |config|
    config.mock_with :rspec

    config.after :each do
      Mongoid.purge!
    end
  end
end

Spork.each_run do
  Mongoid.purge!
end