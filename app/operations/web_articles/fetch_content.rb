require 'rest-client'

module WebArticles
  class FetchContent
    pattr_initialize :article_url

    def call
      response = execute_request
      article_data = JSON.parse(response)
      doc = Nokogiri::HTML(article_data["content"])
      urls = doc.css("img").map { |img_tag| img_tag.attributes["src"].value }
      article_data.merge({"image_urls" => urls})
    end

    private

    def execute_request
      RestClient::Request.execute(
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
    end

    def api_url
      Rails.application.config.mercury_postlight_api_url
    end

    def api_key
      Rails.application.config.mercury_postlight_api_key
    end
  end
end