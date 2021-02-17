require 'spec_helper'
require 'openapi_parser'
require 'committee'
require 'committee/rails/test/methods'

RSpec.configure do |config|
  config.include Committee::Rails::Test::Methods
  config.add_setting :committee_options
  config.committee_options = { schema_path: Rails.root.join('app/controllers/api/v1/open_api.yml').to_s,
                               parse_response_by_content_type: true }
end
