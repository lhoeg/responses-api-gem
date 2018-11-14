require 'simplecov'
SimpleCov.start do
  add_filter '/test/'
end
SimpleCov.command_name 'Gem Unit Tests'

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'responses_api_gem'

require 'minitest/autorun'
