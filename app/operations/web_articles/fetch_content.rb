require 'rest-client'

module WebArticles
  class FetchContent
    API_KEY = Rails.application.config.mercury_postlight_api_key
    API_URL = Rails.application.config.mercury_postlight_api_url
    pattr_initialize :article_url

    def call
      article_data_with_images_urls
    end

    private

    def article_data_with_images_urls
      article_data.merge(
        { "image_urls" => images_urls(article_data) }
      )
    end

    def article_data
      @article_data ||=  JSON.parse(execute_request_to_api)
    end

    def images_urls(article_data)
      doc = Nokogiri::HTML(article_data["content"])
      doc.css("img").map { |img_tag| img_tag.attributes["src"].value }
    end

    def execute_request_to_api
      RestClient::Request.execute(
        method: :get, 
        url: API_URL, 
        headers: {
          "Content-Type" => "application/json", 
          "x-api-key" => API_KEY,
          "params" => {
            "url" => article_url
          },
        }
      )
    end
  end
end