require 'json'
require 'faraday'
require 'pry'
require 'pipedrive_api/config'
require 'pipedrive_api/version'
require 'pipedrive_api/base'
require 'pipedrive_api/deal'


module PipedriveApi
  API_TOKEN = 'cb5f483546f55bee37ba4c0f0f3e97f995ff9d52'.freeze
  COMPANY_DOMAIN = 'test-integration-gem'.freeze
end
