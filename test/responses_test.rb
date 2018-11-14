require 'test_base'

class ResponsesTest < TestBase
  def test_that_it_has_a_version_number
    refute_nil ::ResponsesApiGem::VERSION
  end

  def test_request
    response = ResponsesApi::RetrieveResponsesRequest.execute(form_id, token: token, page_size: 2)
    assert_equal response.success?, true
    assert response.responses
  end
end
