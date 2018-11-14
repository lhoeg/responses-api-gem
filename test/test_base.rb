require 'test_helper'

class TestBase < Minitest::Test
  def form_id
    ENV['TYPEFORM_FORM_ID']
  end

  def token
    ENV['TYPEFORM_API_TOKEN']
  end
end
