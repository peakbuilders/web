# frozen_string_literal: true

require 'spec_helper'
require 'rspec/rails'
# note: require 'devise' after require 'rspec/rails'
require 'devise'

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :system
end
