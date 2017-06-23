require 'rest-client'
require 'uri'

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
      hash_data = article_data.merge(
        { "image_urls" => images_urls(article_data) }
      )
    end

    def article_data
      @article_data ||=  JSON.parse(execute_request_to_api)
    end

    def images_urls(article_data)
      # doc = Nokogiri::HTML(article_data["content"], nil, Encoding::UTF_8.to_s)
      doc = Nokogiri::HTML::DocumentFragment.parse(article_data["content"], Encoding::UTF_8.to_s)
      urls = []
      doc.css("img").each do |img_tag|
        url = img_tag.attributes["src"].value
        urls.push(url)
        img_tag.set_attribute("src", new_image_path(url))
      end
      article_data["content"] = doc.to_s
      urls
    end

    def new_image_path(url)
      uri = URI.parse(url)
      "images/#{File.basename(uri.path)}"
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