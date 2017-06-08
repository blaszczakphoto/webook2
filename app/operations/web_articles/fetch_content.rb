require 'rest-client'

module WebArticles
  class FetchContent
    attr_reader :article_url
    
    def initialize(article_url)
      @article_url = article_url
    end

    def call
      api_url = "https://mercury.postlight.com/parser"
      api_key = ENV.fetch("MERCURY_WEB_PARSER_API_KEY")
      response = RestClient::Request.execute(
        method: :get, 
        url: api_url, 
        headers: {
          "Content-Type" => "application/json", 
          "x-api-key" => api_key,
          "params" => {
            "url" => article_url
          },
        }
      )
      article_data = JSON.parse(response)
      article_data
    end
  end
end