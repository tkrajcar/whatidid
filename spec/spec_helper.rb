# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require 'bundler'
Bundler.setup(:default, :test)

ENV['RACK_ENV'] = 'test'

require 'rack/test'
require_relative '../lib/whatidid.rb'

# custom matchers
Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  # Clean/Reset Mongoid DB prior to running the tests
  config.before :each do
    Mongoid.default_session.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end

