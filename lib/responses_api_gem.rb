require 'json'
require 'rest-client'
# require 'responses_api_gem/api_request.rb'
Gem.find_files('responses_api_gem/**/*.rb').each do |path|
  require path
end

module ResponsesApiGem
  # Your code goes here...
end
