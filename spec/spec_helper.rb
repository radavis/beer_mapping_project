require 'rspec'
require 'vcr'
require_relative '../lib/beer_mapping_project'
require_relative '../lib/brewery'

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = { record: :new_episodes }
  c.filter_sensitive_data('<BEER_MAPPING_API_KEY>') { ENV['BEER_MAPPING_API_KEY'] }
end
