module ResponsesApi
  class APIRequest
    def self.execute(*args, **kwargs)
      new(*args, **kwargs).tap do |request|
        raise StandardError, 'Failed asserting that the request succeeds' unless request.success?
      end
    end

    def headers
      @response.headers
    end

    def inspect
      "#{@response.code}\n#{@response}"
    end

    def bad_request?
      @response.code == 400
    end

    def unauthorized?
      @response.code == 401
    end

    def payment_required?
      @response.code == 402
    end

    def forbidden?
      @response.code == 403
    end

    def not_found?
      @response.code == 404
    end

    def service_unavailable?
      @response.code == 502 || @response.code == 503
    end

    def error_code
      json.fetch(:code)
    end

    private

    def request(args = {})
      RestClient::Request.execute(args) { |r| @response = r }
    end

    def json
      @json ||= JSON.parse(@response, symbolize_names: true)
    end

    def json?
      json
      true
    rescue JSON::ParserError
      false
    end
  end
end
