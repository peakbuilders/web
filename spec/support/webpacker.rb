# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    # Compile our JavaScript
    `bin/webpack`
  end
end
