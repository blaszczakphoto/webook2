module MercuryPostlight
  class ParseWebpage 
    API_KEY = Rails.application.config.mercury_postlight_api_key
    API_URL = Rails.application.config.mercury_postlight_api_url

    pattr_initialize :url

    def call
      parse_result_to_hash
    end

    private

    def parse_result_to_hash
      JSON.parse(execute_request_to_api)
    end

    def execute_request_to_api
      RestClient::Request.execute(
        method: :get, 
        url: API_URL, 
        headers: {
          "Content-Type" => "application/json", 
          "x-api-key" => API_KEY,
          "params" => {
            "url" => url
          },
        }
      )
    end
  end
end